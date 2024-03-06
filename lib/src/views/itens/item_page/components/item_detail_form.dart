import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/item/form/item_form_controller.dart';
import 'package:monitor_mobile/src/views/itens/item_page/form/form.dart';
import '../../../../models/models.dart';

class ItemDetailForm extends StatelessWidget {
  ItemDetailForm({super.key, required this.item});
  final _itemFormController = Get.put(ItemFormController());

  final Item item;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomItemNameForm(item: item.newLastValue),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
