import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventorySiteAddressAForm extends StatefulWidget {
  const CustomInventorySiteAddressAForm({super.key, required this.siteAddressA});
  final String siteAddressA;

  @override
  State<CustomInventorySiteAddressAForm> createState() => _CustomInventorySiteAddressAFormState();
}

class _CustomInventorySiteAddressAFormState extends State<CustomInventorySiteAddressAForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.siteAddressA.text = widget.siteAddressA;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.siteAddressA.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.siteAddressA,
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
          'Site address A',
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
