import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventorySoftwareAppDForm extends StatefulWidget {
  const CustomInventorySoftwareAppDForm({super.key, required this.softwareAppD});
  final String softwareAppD;

  @override
  State<CustomInventorySoftwareAppDForm> createState() => _CustomInventorySoftwareAppDFormState();
}

class _CustomInventorySoftwareAppDFormState extends State<CustomInventorySoftwareAppDForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.softwareAppD.text = widget.softwareAppD;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.softwareAppD.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.softwareAppD,
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
          'Software application D',
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
