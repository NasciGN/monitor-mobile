import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/item/form/item_form_controller.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/itens/item_page/components/item_detail_form.dart';
import 'package:monitor_mobile/src/views/itens/item_page/form/form.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final Item item = Get.arguments;
  final _itemFormController = Get.put(ItemFormController());
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
          )),
      body: _buildInformationSection(context),
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
            ItemDetailForm(
              item: item,
            )
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
