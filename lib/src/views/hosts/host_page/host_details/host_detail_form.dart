import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/host_details/form/form.dart';
import '../../../../controllers/hosts/hosts_form_controller.dart';
import '../../../../models/models.dart';
import 'form/custom_description_form.dart';

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
              : CustomHostListItens(
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
          CustomHostListItens(host: host.parentTemplates, label: 'Templates'),
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

class CustomHostInterfacesList extends StatelessWidget {
  const CustomHostInterfacesList({
    super.key,
    required this.host,
  });

  final Host host;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interfaces',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: host.hostInterfaces.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            host.hostInterfaces[index].ip,
                            style: Theme.of(context).textTheme.labelMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: double.infinity,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    host.hostInterfaces[index].available == "1"
                                        ? Theme.of(context).colorScheme.tertiary
                                        : Theme.of(context).colorScheme.error),
                            child: Center(
                              child: host.hostInterfaces[index].type == "1"
                                  ? Text(
                                      'Zabbix',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )
                                  : Text('SNMP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                            )),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomHostListItens extends StatelessWidget {
  const CustomHostListItens(
      {super.key, required this.host, required this.label});

  final List host;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                )),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: host.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        host[index].name,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
