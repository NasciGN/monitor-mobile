import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/hosts/forms/host_inventory_form_controller.dart';

class CustomInventoryMacaddressAForm extends StatefulWidget {
  const CustomInventoryMacaddressAForm({super.key, required this.macaddressA});
  final String macaddressA;

  @override
  State<CustomInventoryMacaddressAForm> createState() =>
      _CustomInventoryMacaddressAFormState();
}

class _CustomInventoryMacaddressAFormState
    extends State<CustomInventoryMacaddressAForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.macaddressA.text = widget.macaddressA;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.macaddressA.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.macaddressA,
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
          'MAC address A',
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
