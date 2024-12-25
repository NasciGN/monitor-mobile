import 'package:flutter/material.dart';

class TriggerSeverityCard extends StatelessWidget {
  final Color? color;
  final String severity;
  final bool isFirst;
  final bool isLast;
  final String selectedSeverity;
  final ValueChanged<String> onTap;

  static const Map<String, String> severityInitials = {
    '0': 'N',
    '1': 'I',
    '2': 'A',
    '3': 'M',
    '4': 'A',
    '5': 'D',
  };

  const TriggerSeverityCard({
    super.key,
    required this.color,
    required this.severity,
    required this.isFirst,
    required this.isLast,
    required this.selectedSeverity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(severity),
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
}
