import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/item/form/item_form_controller.dart';

class CustomItemStateForm extends StatefulWidget {
  const CustomItemStateForm({super.key, required this.item});
  final String item;

  @override
  State<CustomItemStateForm> createState() => _CustomItemStateFormState();
}

class _CustomItemStateFormState extends State<CustomItemStateForm> {
  final _itemFormControler = Get.put(ItemFormController());

  @override
  void initState() {
    super.initState();
    _itemFormControler.state.text = widget.item;
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
          controller: _itemFormControler.state,
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
          'Chave',
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
