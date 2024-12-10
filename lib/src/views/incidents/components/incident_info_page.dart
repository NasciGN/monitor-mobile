import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';

class IncidentInfoPage extends StatefulWidget {
  const IncidentInfoPage({super.key, required this.event});

  final Event event;
  @override
  State<IncidentInfoPage> createState() => _IncidentInfoPageState();
}

class _IncidentInfoPageState extends State<IncidentInfoPage> {
  FormatData formatData = FormatData();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCardInformation(context, 'Nome', widget.event.name),
        _buildCardInformation(context, 'Severidade',
            '${formatData.getSeverityDescription(widget.event.severity)} (${widget.event.severity})'),
        _buildCardInformation(context, 'Host', widget.event.hosts[0].name),
        _buildCardInformation(context, 'Duração', widget.event.duration),
        _buildCardInformation(context, 'Início', widget.event.newClock),
        _buildTagsSection(context),
      ],
    );
  }

  _buildCardInformation(context, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpd),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
      ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTagsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: defaultpd),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Tags',
                  style: Theme.of(context).textTheme.labelSmall,
                )),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.event.tags.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.event.tags[index].tag}: ${widget.event.tags[index].value}',
                        style: Theme.of(context).textTheme.bodyMedium,
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
