import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/problem/problem_data_controller.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/host_page_skeleton.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/forms/host_infos/host_detail_form.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/forms/host_inventory/host_inventory_form.dart';
import 'components/grid_view_cards.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final Host host = Get.arguments;
  int selectIndex = 0;
  final ItemDataController itemDataController = ItemDataController();
  final ProblemDataController problemDataController = ProblemDataController();
  List<Item> hostItens = [];
  List<Problem> hostProblems = [];
  bool _isLoading = false;

  Future<void> fetchItens() async {
    hostItens.clear();
    hostItens = await itemDataController.fetchItemsByHost(host.id);
  }

  Future<void> fetchEvents() async {
    hostProblems.clear();
    hostProblems = await problemDataController.fetchProblemsByHost(host.id);
  }

  Future<void> _fetchData() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await fetchEvents();
    await fetchItens();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: _buildPadding(),
        child: _isLoading ? const HostPageSkeleton() : _buildBody(context),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);
  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          Get.offNamed('hosts');
        },
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageTitle(context),
          const SizedBox(
            height: defaultpd * 2,
          ),
          _buildGridSection(context),
          const SizedBox(
            height: defaultpd * 2,
          ),
          _buildGraphSection(context),
          const SizedBox(
            height: defaultpd * 2,
          ),
          _buildInformationSection(context),
        ],
      ),
    );
  }

  _buildGraphSection(context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/host_charts', arguments: host.id);
      },
      child: Container(
        width: double.infinity,
        padding: _buildPadding(),
        decoration: _buildContainerDecoration(context),
        child: Row(children: [
          Text(
            'Gráficos',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }

  _buildGridSection(BuildContext context) {
    return Container(
      padding: _buildPadding(),
      width: double.infinity,
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardTitle(context, 'Geral'),
          SizedBox(
            height: 180,
            child: GridViewCards(
              problems: hostProblems,
              itens: hostItens,
              host: host,
            ),
          ),
        ],
      ),
    );
  }

  _buildInformationSection(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: _buildContainerDecoration(context),
        child: Column(
          children: [
            const SizedBox(
              height: defaultpd * 2,
            ),
            _buildPageSelector(),
            const SizedBox(
              height: defaultpd * 2,
            ),
            if (selectIndex == 0) ...[
              HostDetailForm(host: host)
            ] else ...[
              HostInventoryForm(host: host)
            ]
          ],
        ));
  }

  Widget _buildPageSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSelectorButton(0, 'Host'),
        _buildSelectorButton(1, 'Inventário')
      ],
    );
  }

  Widget _buildSelectorButton(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        padding: _buildPadding(),
        width: 150,
        decoration: BoxDecoration(
          color: selectIndex == index
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Opacity(
            opacity: selectIndex == index ? 1.0 : 0.5,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildPageTitle(BuildContext context) {
    return Text(
      host.name,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  _buildCardTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
