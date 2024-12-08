import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/models.dart';

class IncidentCard extends StatefulWidget {
  const IncidentCard({super.key, required this.events});

  final Event events;
  @override
  State<IncidentCard> createState() => _IncidentCardState();
}

class _IncidentCardState extends State<IncidentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('incident_page', arguments: widget.events);
      },
      onLongPress: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 120,
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 90,
              decoration: BoxDecoration(
                color: getSeverityColors(widget.events.severity)["bgColor"],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: defaultpd * 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.events.name,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    widget.events.hosts[0].name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(widget.events.duration,
                      style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
