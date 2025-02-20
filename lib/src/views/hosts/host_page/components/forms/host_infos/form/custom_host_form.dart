import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/host/forms/hosts_form_controller.dart';

class CustomHostForm extends StatefulWidget {
  const CustomHostForm({super.key, required this.host});
  final String host;

  @override
  State<CustomHostForm> createState() => _CustomHostFormState();
}

class _CustomHostFormState extends State<CustomHostForm> {
  final _hostFormControler = Get.put(HostFormController());

  @override
  void initState() {
    super.initState();
    _hostFormControler.host.text = widget.host;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      enabled: _hostFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostFormControler.host,
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
          'Host',
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
