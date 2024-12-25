import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/models/models.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.group,
    required this.hostsForGroup,
  });

  final Group group;
  final List<Host> hostsForGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.name,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '(${hostsForGroup.length})',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
