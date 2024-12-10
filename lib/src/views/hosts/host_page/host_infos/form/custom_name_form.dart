import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/host/forms/hosts_form_controller.dart';

class CustomHostNameForm extends StatefulWidget {
  const CustomHostNameForm({super.key, required this.name});

  final String name;

  @override
  State<CustomHostNameForm> createState() => _CustomHostNameFormState();
}

class _CustomHostNameFormState extends State<CustomHostNameForm> {
  final _hostFormControler = Get.put(HostFormController());
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    _hostFormControler.name.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: _hostFormControler.isEdit,
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: TextInputAction.next,
      controller: _hostFormControler.name,
      minLines: 1,
      maxLines: 2,
      decoration: _buildDecoration(context),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary,
        filled: true,
        label: Text(
          'Nome visível',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Theme.of(context).colorScheme.primary);
  }
}
