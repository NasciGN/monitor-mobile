import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/host/forms/host_inventory_form_controller.dart';

class CustomInventoryPoc1Screen1screenForm extends StatefulWidget {
  const CustomInventoryPoc1Screen1screenForm(
      {super.key, required this.poc_1Screen});
  final String poc_1Screen;

  @override
  State<CustomInventoryPoc1Screen1screenForm> createState() =>
      _CustomInventoryPoc1Screen1screenFormState();
}

class _CustomInventoryPoc1Screen1screenFormState
    extends State<CustomInventoryPoc1Screen1screenForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_1Screen.text = widget.poc_1Screen;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.poc_1Screen.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.poc_1Screen,
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
          'Primary POC screen name',
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
