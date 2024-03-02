import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/hosts_form_controller.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        enabled: _hostFormControler.isEdit,
        style: Theme.of(context).textTheme.labelMedium,
        textInputAction: TextInputAction.next,
        controller: _hostFormControler.name,
        decoration: _buildDecoration(context),
      ),
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
