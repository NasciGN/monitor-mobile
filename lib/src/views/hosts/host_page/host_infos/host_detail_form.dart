import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/custom_host_interface_itens.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/components/custom_host_list_info.dart';

import '../../../../controllers/host/forms/hosts_form_controller.dart';
import '../../../../models/models.dart';
import 'form/custom_description_form.dart';
import 'form/form.dart';

class HostDetailForm extends StatelessWidget {
  HostDetailForm({super.key, required this.host});
  final _hostFormControler = Get.put(HostFormController());

  final Host host;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomHostForm(host: host.host),
          const SizedBox(
            height: 20,
          ),
          CustomHostNameForm(name: host.name),
          const SizedBox(
            height: 20,
          ),
          _hostFormControler.isEdit
              ? CustomHostGroupsForm(name: host.name)
              : CustomHostListInfo(
                  host: host.hostGroups,
                  label: 'Grupos',
                ),
          const SizedBox(
            height: 20,
          ),
          CustomHostInterfacesList(host: host),
          const SizedBox(
            height: 20,
          ),
          CustomHostListInfo(host: host.parentTemplates, label: 'Templates'),
          const SizedBox(
            height: 20,
          ),
          CustomDescriptionForm(host: host.description),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: host.hostInterfaces
                          .any((element) => element.available.contains("1"))
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.error),
              child: Center(
                child: host.hostInterfaces
                        .any((element) => element.available.contains("1"))
                    ? Text(
                        "Ativo",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    : Text(
                        "Inativo",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
