import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventorySiteRackForm extends StatefulWidget {
  const CustomInventorySiteRackForm({super.key, required this.siteRack});
  final String siteRack;

  @override
  State<CustomInventorySiteRackForm> createState() => _CustomInventorySiteRackFormState();
}

class _CustomInventorySiteRackFormState extends State<CustomInventorySiteRackForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.siteRack.text = widget.siteRack;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.siteRack.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.siteRack,
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
          'Site rack location',
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
