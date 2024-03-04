import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/hosts/forms/host_inventory_form_controller.dart';

class CustomInventorySoftwareAppAForm extends StatefulWidget {
  const CustomInventorySoftwareAppAForm(
      {super.key, required this.softwareAppA});
  final String softwareAppA;

  @override
  State<CustomInventorySoftwareAppAForm> createState() =>
      _CustomInventorySoftwareAppAFormState();
}

class _CustomInventorySoftwareAppAFormState
    extends State<CustomInventorySoftwareAppAForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.softwareAppA.text = widget.softwareAppA;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.softwareAppA.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.softwareAppA,
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
          'Software application A',
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
