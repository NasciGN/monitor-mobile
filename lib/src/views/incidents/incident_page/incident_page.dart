import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/event.dart';

class IncidentPage extends StatefulWidget {
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  final event = Get.arguments as Event;
  int _currentIndex = 0; // Índice da página
  FormatData formatData = FormatData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(defaultpd * 2),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: _buildInformationSection(context),
        ),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        'Evento',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buildContainerDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(defaultpd * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageSelector(),
            const SizedBox(height: 16), // Espaço entre o menu e as informações
            if (_currentIndex == 0) ...[
              _buildCardInformation(context, 'Nome', event.name),
              _buildCardInformation(context, 'Severidade',
                  '${formatData.getSeverityDescription(event.severity)} (${event.severity})'),
              _buildCardInformation(context, 'Host', event.hosts[0].name),
              _buildCardInformation(context, 'Duração', event.duration),
              _buildCardInformation(context, 'Início', event.newClock),
              _buildTagsSection(context),
            ] else ...[
              _buildUpdatePage(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPageSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSelectorButton(0, 'Informações'),
        _buildSelectorButton(1, 'Atualizar'),
      ],
    );
  }

  Widget _buildSelectorButton(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: _buildPadding(),
        width: 150,
        decoration: BoxDecoration(
          color: _currentIndex == index
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Opacity(
            opacity: _currentIndex == index ? 1.0 : 0.5,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpdatePage(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Atualizar Incidente',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Adicione a lógica de atualização aqui
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
                itemCount: event.tags.length,
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
                        '${event.tags[index].tag}: ${event.tags[index].value}',
                        style: Theme.of(context).textTheme.labelMedium,
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
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildPageTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
