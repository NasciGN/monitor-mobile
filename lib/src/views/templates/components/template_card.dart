import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/models.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    super.key,
    required this.searchTemplates,
  });

  final Template searchTemplates;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/template_page', arguments: searchTemplates);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              searchTemplates.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
