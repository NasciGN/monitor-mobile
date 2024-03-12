import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final Item item = Get.arguments;
  ItemDataController itemDataController = ItemDataController();
  List<ItemHistory> history = [];
  bool _isLoading = false;

  Future<void> _getItemHistory() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    history = await itemDataController.fetchItemHistory(item.itemId);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getItemHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Item',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: _buildInformationSection(context),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(16);

  _buildInformationSection(BuildContext context) {
    return Padding(
      padding: _buildPadding(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: defaultpd * 2, horizontal: defaultpd * 2),
                decoration: _buildContainerDecoration(context),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(children: [
                        Text('Informações',
                            style: Theme.of(context).textTheme.displayMedium),
                        const Spacer(),
                        item.valueType == "0" || item.valueType == "3"
                            ? IconButton(
                                onPressed: () {
                                  Get.toNamed('/item_graph',
                                      arguments:
                                          '/chart.php?itemids%5B0%5D=${item.itemId}');
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.chartColumn,
                                  color: Colors.white,
                                ))
                            : const SizedBox.shrink(),
                      ]),
                    ),
                    _buildCardInformation(context, 'Nome', item.name),
                    _buildCardInformation(context, 'Status', item.newStatus),
                    _buildCardInformation(context, 'Ultimo valor: ',
                        '${item.newLastValue} ${item.newUnits}'),
                    _buildCardInformation(
                        context, 'Última checagem', item.newLastClock),
                    _buildCardInformation(context, 'Intervalo', item.delay),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _buildHistorySection(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpd * 2),
      padding: const EdgeInsets.symmetric(
          vertical: defaultpd * 2, horizontal: defaultpd * 2),
      decoration: _buildContainerDecoration(context),
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          child: Text('Histórico',
              style: Theme.of(context).textTheme.displayMedium),
        ),
        (history.isEmpty || history.length < 10) && _isLoading
            ? SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultpd * 4),
                  child: Center(
                      child: Text(
                    'Nenhum histórico para listar',
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
                ),
              )
            : _buildCardInformation(
                context, history[0].newClock, history[0].value)
      ]),
    );
  }

  _buildCardInformation(context, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpd),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
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

  Text _buildFirstCardTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
