import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';

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
                  return GestureDetector(
                    onTap: () {
                      _showBottomSheet(context, host.hostInterfaces[index]);
                    },
                    child: Container(
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
                              host.hostInterfaces[index].useIp == '1'
                                  ? host.hostInterfaces[index].ip
                                  : host.hostInterfaces[index].dns,
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: double.infinity,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: host.hostInterfaces[index].available ==
                                          "1"
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.error),
                              child: Center(
                                child: Text(
                                  host.hostInterfaces[index]
                                      .interfaceTypeString,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )),
                        ],
                      ),
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

  Future<dynamic> _showBottomSheet(BuildContext context, Interface interface) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (BuildContext context) {
        return SNMPContainer(
          interfaceData: interface,
        );
      },
    );
  }
}

class SNMPContainer extends StatefulWidget {
  final Interface interfaceData;

  const SNMPContainer({Key? key, required this.interfaceData})
      : super(key: key);

  @override
  State<SNMPContainer> createState() => _SNMPContainerState();
}

class _SNMPContainerState extends State<SNMPContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _buildPadding(),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: _buildContainerDecoration(context),
        padding: _buildPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageTitle(context),
              const SizedBox(
                height: defaultpd * 2,
              ),
              Row(
                children: [
                  Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.interfaceData.available == "1"
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.error),
                      child: Center(
                        child: Text(
                          widget.interfaceData.interfaceTypeString,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )),
                  const SizedBox(
                    width: 16, // substitui defaultpd
                  ),
                  Expanded(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      initialValue: widget.interfaceData.useIp == '1'
                          ? widget.interfaceData.ip
                          : widget.interfaceData.dns,
                      minLines: 1,
                      maxLines: 2,
                      decoration: _buildDecorationWithoutLabel(context),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              _buildRow(
                context,
                'Endereço IP',
                widget.interfaceData.ip,
                'Porta',
                widget.interfaceData.port,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      initialValue: widget.interfaceData.dns,
                      minLines: 1,
                      maxLines: 2,
                      decoration: _buildDecoration(context, 'DNS'),
                    ),
                  ),
                  const SizedBox(
                    width: defaultpd * 2,
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: widget.interfaceData.useIp == '1'
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                          ),
                          height: 70,
                          width: 60,
                          child: Center(
                              child: widget.interfaceData.useIp == '1'
                                  ? Text(
                                      'IP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  : Text(
                                      'IP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ))),
                      Container(
                        decoration: BoxDecoration(
                          color: widget.interfaceData.useIp == '0'
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.zero,
                            bottomLeft: Radius.zero,
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        height: 70,
                        width: 60,
                        child: Center(
                            child: widget.interfaceData.useIp == '0'
                                ? Text(
                                    'DNS',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                : Text(
                                    'DNS',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: defaultpd * 2),
              widget.interfaceData.interfaceTypeString == 'SNMP'
                  ? TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      initialValue: widget.interfaceData.details.community,
                      minLines: 1,
                      maxLines: 2,
                      decoration: _buildDecoration(context, 'Comunidade SNMP'),
                    )
                  : const SizedBox(),
              const SizedBox(height: defaultpd * 2),
              widget.interfaceData.interfaceTypeString == 'SNMP'
                  ? TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      initialValue: widget.interfaceData.details.version,
                      minLines: 1,
                      maxLines: 2,
                      decoration: _buildDecoration(context, 'Versão SNMP'),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildPageTitle(BuildContext context) {
    return Text(
      'Interface',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);
  Widget _buildRow(BuildContext context, String label1, String value1,
      String label2, String value2) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            enabled: false,
            textInputAction: TextInputAction.next,
            initialValue: value1,
            minLines: 1,
            maxLines: 2,
            decoration: _buildDecoration(context, label1),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            enabled: false,
            textInputAction: TextInputAction.next,
            initialValue: value2,
            minLines: 1,
            maxLines: 2,
            decoration: _buildDecoration(context, label2),
          ),
        ),
      ],
    );
  }

  InputDecoration _buildDecorationWithoutLabel(BuildContext context) {
    return InputDecoration(
      fillColor: Theme.of(context).colorScheme.primary,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusColor: Theme.of(context).colorScheme.primary,
    );
  }

  InputDecoration _buildDecoration(BuildContext context, String label) {
    return InputDecoration(
      fillColor: Theme.of(context).colorScheme.primary,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      label: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusColor: Theme.of(context).colorScheme.primary,
    );
  }
}
