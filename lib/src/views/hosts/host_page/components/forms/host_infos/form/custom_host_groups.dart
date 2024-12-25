import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../../../../controllers/host/forms/hosts_form_controller.dart';

class CustomHostGroupsForm extends StatefulWidget {
  const CustomHostGroupsForm({super.key, required this.name});

  final String name;

  @override
  State<CustomHostGroupsForm> createState() => _CustomHostGroupsFormState();
}

class _CustomHostGroupsFormState extends State<CustomHostGroupsForm> {
  final _hostFormControler = Get.put(HostFormController());
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    _hostFormControler.name.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: MultiSelectDropDown(
          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
          onOptionSelected: (options) {},
          onOptionRemoved: (index, option) {},
          searchEnabled: true,
          optionsBackgroundColor: Theme.of(context).colorScheme.secondary,
          fieldBackgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Colors.transparent,
          dropdownBackgroundColor: Theme.of(context).colorScheme.primary,
          focusedBorderColor: Colors.transparent,
          searchBackgroundColor: Colors.transparent,
          hintColor: Colors.white,
          hintFontSize: 20,
          searchLabel: 'Grupos',
          optionTextStyle: Theme.of(context).textTheme.labelMedium,
          optionBuilder: (context, valueItem, isSelected) {
            return ListTile(
              title: Text(valueItem.label),
              subtitle: Text(valueItem.value.toString()),
              trailing: isSelected
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.white,
                    ),
            );
          },
          options: const [
            ValueItem(label: 'Grupo 01', value: '01'),
            ValueItem(label: 'Grupo 02', value: '02'),
            ValueItem(label: 'Grupo 03', value: '03'),
            ValueItem(label: 'Grupo 04', value: '04'),
            ValueItem(label: 'Grupo 05', value: '05')
          ]),
    );
  }
}
