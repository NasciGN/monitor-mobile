import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/hosts/forms/host_inventory_form_controller.dart';

class CustomInventorySoftwareAppEForm extends StatefulWidget {
  const CustomInventorySoftwareAppEForm(
      {super.key, required this.softwareAppE});
  final String softwareAppE;

  @override
  State<CustomInventorySoftwareAppEForm> createState() =>
      _CustomInventorySoftwareAppEFormState();
}

class _CustomInventorySoftwareAppEFormState
    extends State<CustomInventorySoftwareAppEForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.softwareAppE.text = widget.softwareAppE;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.softwareAppE.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.softwareAppE,
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
          'Software application E',
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
