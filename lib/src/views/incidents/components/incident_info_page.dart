import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/incidents/components/tag_section.dart';

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
    return Container(
      padding: _buildPadding(),
      decoration: _buildContainerDecoration(context),
      child: Column(
        children: [
          _buildCardInformation(context, 'Nome', widget.event.name),
          _buildCardInformation(context, 'Severidade',
              '${formatData.getSeverityDescription(widget.event.severity)} (${widget.event.severity})'),
          _buildCardInformation(context, 'Host', widget.event.hosts[0].name),
          _buildCardInformation(context, 'Duração', widget.event.duration),
          _buildCardInformation(context, 'Início', widget.event.newClock),
          TagSection(tags: widget.event.tags),
        ],
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(10),
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
}
