import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventoryPoc1PhoneB1phonebForm extends StatefulWidget {
  const CustomInventoryPoc1PhoneB1phonebForm({super.key, required this.poc_1PhoneB});
  final String poc_1PhoneB;

  @override
  State<CustomInventoryPoc1PhoneB1phonebForm> createState() => _CustomInventoryPoc1PhoneB1phonebFormState();
}

class _CustomInventoryPoc1PhoneB1phonebFormState extends State<CustomInventoryPoc1PhoneB1phonebForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_1PhoneB.text = widget.poc_1PhoneB;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.poc_1PhoneB.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.poc_1PhoneB,
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
          'Primary POC phone B',
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
