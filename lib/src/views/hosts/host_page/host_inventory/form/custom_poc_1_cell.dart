import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventoryPoc1Cell1cellForm extends StatefulWidget {
  const CustomInventoryPoc1Cell1cellForm({super.key, required this.poc_1Cell});
  final String poc_1Cell;

  @override
  State<CustomInventoryPoc1Cell1cellForm> createState() => _CustomInventoryPoc1Cell1cellFormState();
}

class _CustomInventoryPoc1Cell1cellFormState extends State<CustomInventoryPoc1Cell1cellForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_1Cell.text = widget.poc_1Cell;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.poc_1Cell.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.poc_1Cell,
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
          'Primary POC mobile number',
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
