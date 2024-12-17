import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
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
    selectedSeverity = widget.event.severity;
  }

  void _checkIsAcknowledged() {
    if (widget.event.acknowledged == '1') {
      isAcknowledged = true;
    }
  }

  String selectedSeverity = '';
  Map<String, Color> getSeverityColors(String severity) {
    switch (severity) {
      case '0':
        return notClassified;
      case '1':
        return information;
      case '2':
        return warning;
      case '3':
        return average;
      case '4':
        return high;
      case '5':
        return disaster;
      default:
        return {
          "txtColor": Colors.grey,
          "bgColor": Colors.grey
        }; // Cor padrão caso não haja correspondência
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _buildPadding(),
      decoration: _buildContainerDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  height: 30,
                  width: 180,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          _buildTriggerSeverityCard(
                              getSeverityColors('5')["bgColor"],
                              '5',
                              true,
                              false), // Primeiro item
                          _buildTriggerSeverityCard(
                              getSeverityColors('4')["bgColor"],
                              '4',
                              false,
                              false),
                          _buildTriggerSeverityCard(
                              getSeverityColors('3')["bgColor"],
                              '3',
                              false,
                              false),
                          _buildTriggerSeverityCard(
                              getSeverityColors('2')["bgColor"],
                              '2',
                              false,
                              false),
                          _buildTriggerSeverityCard(
                              getSeverityColors('1')["bgColor"],
                              '1',
                              false,
                              false),
                          _buildTriggerSeverityCard(
                              getSeverityColors('0')["bgColor"],
                              '0',
                              false,
                              true), // Último item
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
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
                        side: const BorderSide(
                            color: Colors.white30, width: 2.0)),
                    Text('Reconhecido',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          _buildTextField(context),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      darkScdBgColor), // Fundo transparente
                  foregroundColor: WidgetStateProperty.all(Colors.blue),
                  side: WidgetStateProperty.all(
                    const BorderSide(
                      color: darkBtnColor,
                      width: 2.0,
                    ),
                  ),
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incidente atualizado!')),
                  );
                },
                child: const Text('Atualizar'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTriggerSeverityCard(
      Color? color, String severity, bool isFirst, bool isLast) {
    final Map<String, String> severityInitials = {
      '0': 'N',
      '1': 'I',
      '2': 'A',
      '3': 'M',
      '4': 'A',
      '5': 'D',
    };

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeverity = severity;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: isFirst ? const Radius.circular(5) : Radius.zero,
            bottomLeft: isFirst ? const Radius.circular(5) : Radius.zero,
            topRight: isLast ? const Radius.circular(5) : Radius.zero,
            bottomRight: isLast ? const Radius.circular(5) : Radius.zero,
          ),
          border: Border.all(
            color: selectedSeverity == severity
                ? Colors.white
                : Colors.transparent,
            width: 2.0,
          ),
        ),
        height: 30,
        width: 30,
        child: Center(
          child: severity == selectedSeverity
              ? Text(
                  severityInitials[severity] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  TextField _buildTextField(BuildContext context) {
    return TextField(
      //onChanged: (value) => _searchData(value),
      style: Theme.of(context).textTheme.bodySmall,
      decoration: _buildTextFieldDecoration(context),
    );
  }

  InputDecoration _buildTextFieldDecoration(BuildContext context) {
    return InputDecoration(
        label: Text(
          'Mensagem',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
