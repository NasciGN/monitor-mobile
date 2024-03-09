import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final Item item = Get.arguments;

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
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: defaultpd * 2, horizontal: defaultpd * 2),
            decoration: _buildContainerDecoration(context),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(children: [
                    const Text('Informações'),
                    const Spacer(),
                    item.valueType == "0" || item.valueType == "3"
                        ? IconButton(
                            onPressed: () {
                              Get.offNamed('item_graph',
                                  arguments: item.itemId);
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
      ),
    );
  }

  _buildHistorySection(context) {
    return Container();
  }

  _buildCardInformation(conext, String label, String value) {
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
