import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/host/forms/host_inventory_form_controller.dart';

class CustomInventoryDeploymentStatusForm extends StatefulWidget {
  const CustomInventoryDeploymentStatusForm(
      {super.key, required this.deploymentStatus});
  final String deploymentStatus;

  @override
  State<CustomInventoryDeploymentStatusForm> createState() =>
      _CustomInventoryDeploymentStatusFormState();
}

class _CustomInventoryDeploymentStatusFormState
    extends State<CustomInventoryDeploymentStatusForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.deploymentStatus.text = widget.deploymentStatus;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.deploymentStatus.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          enabled: _hostInventoryFormControler.isEdit,
          textInputAction: TextInputAction.next,
          controller: _hostInventoryFormControler.deploymentStatus,
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
          'Deployment status',
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
