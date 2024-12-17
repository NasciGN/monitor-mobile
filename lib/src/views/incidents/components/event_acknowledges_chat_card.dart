import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';

class EventAcknowledgesChatCard extends StatefulWidget {
  const EventAcknowledgesChatCard({
    super.key,
    required this.acknowledged,
  });
  final Acknowledge acknowledged;
  @override
  State<EventAcknowledgesChatCard> createState() =>
      _EventAcknowledgesChatCardState();
}

class _EventAcknowledgesChatCardState extends State<EventAcknowledgesChatCard> {
  @override
  Widget build(BuildContext context) {
    FormatData formatData = FormatData();
    List<String> actions =
        formatData.identifyAction(widget.acknowledged.action);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: defaultpd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultpd),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.acknowledged.username} (${widget.acknowledged.name} ${widget.acknowledged.surname})',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Container(
                  decoration: _buildContainerDecoration(context),
                  child: Row(
                    children: [
                      if (actions.contains("Reconhecer evento"))
                        Container(
                          margin: const EdgeInsets.all(defaultpd),
                          child: const FaIcon(
                            FontAwesomeIcons.check,
                            size: defaultpd * 2,
                          ),
                        ),
                      if (actions.contains("Adicionar mensagem"))
                        Container(
                          margin: const EdgeInsets.all(defaultpd),
                          child: const FaIcon(
                            FontAwesomeIcons.message,
                            size: defaultpd * 2,
                          ),
                        ),
                      if (actions.contains("Alterar severidade"))
                        Container(
                          margin: const EdgeInsets.all(defaultpd),
                          child: const FaIcon(
                            FontAwesomeIcons.retweet,
                            size: defaultpd * 2,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: defaultpd,
            ),
            widget.acknowledged.message == ""
                ? Container(
                    padding: const EdgeInsets.all(defaultpd),
                    decoration: _buildContainerDecoration(context),
                    child: Center(
                      child: Text(
                        'Nenhuma mensagem.',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.acknowledged.message,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
            const SizedBox(
              height: defaultpd * 2,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.acknowledged.newClock,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
