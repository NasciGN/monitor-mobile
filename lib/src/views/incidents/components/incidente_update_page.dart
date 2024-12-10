import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';

class IncidentUpdatePage extends StatefulWidget {
  const IncidentUpdatePage({super.key, required this.event});

  final Event event;
  @override
  State<IncidentUpdatePage> createState() => _IncidentUpdatePageState();
}

class _IncidentUpdatePageState extends State<IncidentUpdatePage> {
  bool isAcknowledged = false;
  @override
  void initState() {
    super.initState();
    _checkIsAcknowledged();
  }

  void _checkIsAcknowledged() {
    if (widget.event.acknowledged == '1') {
      isAcknowledged = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAcknowledged = !isAcknowledged;
                });
              },
              child: Row(
                children: [
                  Checkbox(
                      value: isAcknowledged,
                      onChanged: (bool? value) {
                        setState(() {
                          isAcknowledged = value!;
                        });
                      },
                      activeColor: Colors.white30,
                      checkColor: Colors.white,
                      side:
                          const BorderSide(color: Colors.white30, width: 2.0)),
                  const Text('Reconhecido'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Incidente atualizado!')),
              );
            },
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }
}

EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

BoxDecoration _buildContainerDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).colorScheme.secondary,
    borderRadius: BorderRadius.circular(10),
  );
}

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
