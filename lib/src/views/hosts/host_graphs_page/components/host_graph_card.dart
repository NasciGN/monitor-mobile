import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/graph.dart';

class HostGraphCard extends StatefulWidget {
  const HostGraphCard({super.key, required this.hostGraph});

  final Graph hostGraph;

  @override
  State<HostGraphCard> createState() => _HostGraphCardState();
}

class _HostGraphCardState extends State<HostGraphCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultpd * 2),
      width: double.infinity,
      padding: const EdgeInsets.all(defaultpd * 2),
      decoration: _buildContainerDecoration(context),
      child: Row(children: [
        SizedBox(
          width: 240,
          child: Text(
            widget.hostGraph.name,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        const FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.white,
        ),
      ]),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10));
  }
}
