import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/host/forms/host_inventory_form_controller.dart';

class CustomInventoryNotesForm extends StatefulWidget {
  const CustomInventoryNotesForm({super.key, required this.notes});
  final String notes;

  @override
  State<CustomInventoryNotesForm> createState() =>
      _CustomInventoryNotesFormState();
}

class _CustomInventoryNotesFormState extends State<CustomInventoryNotesForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.notes.text = widget.notes;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.notes.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.notes,
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
          'Notes',
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
