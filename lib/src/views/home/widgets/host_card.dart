import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/models/host.dart';

class HostCard extends StatefulWidget {
  const HostCard({
    super.key,
    required this.host,
  });

  final Host host;

  @override
  State<HostCard> createState() => _HostCardState();
}

class _HostCardState extends State<HostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.host.name,
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              widget.host.status == '0'
                  ? Text(
                      'Ativo',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  : Text(
                      'Inativo',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'SNMP',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'ZABBIX',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
