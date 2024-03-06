import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

import 'components/grid_view_cards.dart';
import 'components/indexed_stack_pages.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Future<void> fetchItens() async {
    hostItens.clear();
    hostItens = await itemDataController.fetchItemsByHost(host.id);
    setState(() {});
  }

  Future<void> fetchEvents() async {
    hostProblems.clear();
    hostProblems = await problemDataController.fetchProblemsByHost(host.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchItens();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

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
          Get.offNamed('/home');
        },
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: _buildPadding(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageTitle(context),
            Container(
              height: 220,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: _buildContainerDecoration(context),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFirstCardTitle(context, 'Geral'),
                    _buildGridView(context),
                  ]),
            ),
            _buildInformationSection(context),
          ],
        ),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(16);

  Container _buildInformationSection(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: _buildContainerDecoration(context),
        child: Column(
          children: [
            Padding(
              padding: _buildPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () => _onItemTapped(0),
                      child: selectIndex == 0
                          ? _buildSelectOptionIndexedStack(context, 'Host')
                          : _buildUnselectOptionIndexedStack(context, 'Host')),
                  GestureDetector(
                    onTap: () => _onItemTapped(1),
                    child: selectIndex == 1
                        ? _buildSelectOptionIndexedStack(context, 'Inventário')
                        : _buildUnselectOptionIndexedStack(
                            context, 'Inventário'),
                  )
                ],
              ),
            ),
            IndexedStackPages(selectIndex: selectIndex, host: host)
          ],
        ));
  }

  _buildSelectOptionIndexedStack(context, String label) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  _buildUnselectOptionIndexedStack(context, String label) {
    return Opacity(
        opacity: 0.5, child: _buildSelectOptionIndexedStack(context, label));
  }

  Text _buildPageTitle(BuildContext context) {
    return Text(
      host.name,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Text _buildFirstCardTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Expanded _buildGridView(BuildContext context) {
    return Expanded(
      child: GridViewCards(
        problems: hostProblems,
        itens: hostItens,
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
