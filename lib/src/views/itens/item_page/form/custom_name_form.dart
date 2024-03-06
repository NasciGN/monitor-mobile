import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/item/form/item_form_controller.dart';

class CustomItemNameForm extends StatefulWidget {
  const CustomItemNameForm({super.key, required this.item});
  final String item;

  @override
  State<CustomItemNameForm> createState() => _CustomItemNameFormState();
}

class _CustomItemNameFormState extends State<CustomItemNameForm> {
  final _itemFormControler = Get.put(ItemFormController());

  @override
  void initState() {
    super.initState();
    _itemFormControler.name.text = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          minLines: 1,
          maxLines: 10,
          enabled: _itemFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _itemFormControler.name,
          decoration: _buildDecoration(context),
        ),
      ],
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary,
        filled: true,
        label: Text(
          'Nome',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: Theme.of(context).textTheme.labelMedium,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Theme.of(context).colorScheme.primary);
  }
}
