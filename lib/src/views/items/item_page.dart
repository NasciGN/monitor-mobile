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
  List<History> history = [];

  @override
  void initState() {
    super.initState();
  }

  void _loadHistory() async {
    try {
      final fetchedHistory =
          await itemDataController.fetchHistory(item.itemId, item.units);

      setState(() {
        history = fetchedHistory;
      });
    } catch (e) {
      debugPrint('Erro ao buscar histórico: $e');
    }
  }

  EdgeInsets _buildPadding() =>
      const EdgeInsets.symmetric(horizontal: defaultpd * 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: _buildPadding(),
          child: Column(
            children: [
              _buildInformationSection(context),
              const SizedBox(height: 20),
              _buildHistorySection(context),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  _buildInformationSection(BuildContext context) {
    return Container(
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
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                item.valueType == "0" || item.valueType == "3"
                    ? IconButton(
                        onPressed: () {
                          Get.toNamed('/chart',
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
        ));
  }

  _buildHistorySection(context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: defaultpd * 2, horizontal: defaultpd * 2),
      decoration: _buildContainerDecoration(context),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Histórico',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
