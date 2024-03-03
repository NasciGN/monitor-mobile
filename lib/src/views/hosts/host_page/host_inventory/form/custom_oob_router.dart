import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/hosts/host_inventory_form_controller.dart';

class CustomInventoryOobRouterForm extends StatefulWidget {
  const CustomInventoryOobRouterForm({super.key, required this.oobRouter});
  final String oobRouter;

  @override
  State<CustomInventoryOobRouterForm> createState() => _CustomInventoryOobRouterFormState();
}

class _CustomInventoryOobRouterFormState extends State<CustomInventoryOobRouterForm> {
  final _hostInventoryFormControler = Get.put(HostInvetoryFormController());

  @override
  void initState() {
    super.initState();
    _hostInventoryFormControler.oobRouter.text = widget.oobRouter;
  }

  @override
  Widget build(BuildContext context) {
   if (widget.oobRouter.isEmpty) {
      return SizedBox();
    }
    return Column(
      children: [
        TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      enabled: _hostInventoryFormControler.isEdit,
      textInputAction: TextInputAction.next,
      controller: _hostInventoryFormControler.oobRouter,
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
          'OOB router',
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
