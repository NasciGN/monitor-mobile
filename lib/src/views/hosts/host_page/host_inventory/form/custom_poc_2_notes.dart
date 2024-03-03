import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventoryPoc2Notes2notesForm extends StatefulWidget {
  const CustomInventoryPoc2Notes2notesForm({super.key, required this.poc_2Notes});
  final String poc_2Notes;

  @override
  State<CustomInventoryPoc2Notes2notesForm> createState() => _CustomInventoryPoc2Notes2notesFormState();
}

class _CustomInventoryPoc2Notes2notesFormState extends State<CustomInventoryPoc2Notes2notesForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_2Notes.text = widget.poc_2Notes;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.poc_2Notes.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.poc_2Notes,
      minLines: 1,
      maxLines: 2,
      decoration: _buildDecoration(context),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary,
        filled: true,
        label: Text(
          'Secondary POC notes',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
