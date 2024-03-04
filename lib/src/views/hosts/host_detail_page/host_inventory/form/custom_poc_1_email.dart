import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/hosts/forms/host_inventory_form_controller.dart';

class CustomInventoryPoc1Email1emailForm extends StatefulWidget {
  const CustomInventoryPoc1Email1emailForm(
      {super.key, required this.poc_1Email});
  final String poc_1Email;

  @override
  State<CustomInventoryPoc1Email1emailForm> createState() =>
      _CustomInventoryPoc1Email1emailFormState();
}

class _CustomInventoryPoc1Email1emailFormState
    extends State<CustomInventoryPoc1Email1emailForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.poc_1Email.text = widget.poc_1Email;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.poc_1Email.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.poc_1Email,
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
          'Primary email',
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
