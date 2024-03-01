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
      margin: EdgeInsets.all(8),
      child: Text(
        widget.host.name,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
