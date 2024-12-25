import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/host/forms/hosts_form_controller.dart';

class CustomDescriptionForm extends StatefulWidget {
  const CustomDescriptionForm({super.key, required this.host});
  final String host;

  @override
  State<CustomDescriptionForm> createState() => _CustomDescriptionFormState();
}

class _CustomDescriptionFormState extends State<CustomDescriptionForm> {
  final _hostFormControler = Get.put(HostFormController());

  @override
  void initState() {
    super.initState();
    _hostFormControler.description.text = widget.host;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          minLines: 1,
          maxLines: 10,
          enabled: _hostFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostFormControler.description,
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
          'Descrição',
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
