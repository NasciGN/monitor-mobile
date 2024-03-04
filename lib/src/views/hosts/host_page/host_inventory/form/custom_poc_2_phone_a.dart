import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventoryPoc2PhoneA2phoneaForm extends StatefulWidget {
  const CustomInventoryPoc2PhoneA2phoneaForm({super.key, required this.poc_2PhoneA});
  final String poc_2PhoneA;

  @override
  State<CustomInventoryPoc2PhoneA2phoneaForm> createState() => _CustomInventoryPoc2PhoneA2phoneaFormState();
}

class _CustomInventoryPoc2PhoneA2phoneaFormState extends State<CustomInventoryPoc2PhoneA2phoneaForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_2PhoneA.text = widget.poc_2PhoneA;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.poc_2PhoneA.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.poc_2PhoneA,
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
          'Secondary POC phone A',
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
