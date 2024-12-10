import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/event.dart';
import 'package:monitor_mobile/src/views/incidents/components/incident_info_page.dart';
import 'package:monitor_mobile/src/views/incidents/components/incidente_update_page.dart';

class IncidentPage extends StatefulWidget {
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  final event = Get.arguments as Event;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(defaultpd * 2),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: _buildInformationSection(context),
          ),
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
          Get.offNamed('/incidents_list_page');
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
              IncidentInfoPage(
                event: event,
              ),
            ] else ...[
              IncidentUpdatePage(
                event: event,
              )
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

  TextField _buildTextField() {
    return TextField(
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: _buildTextFieldDecoration(),
    );
  }

  InputDecoration _buildTextFieldDecoration() {
    return InputDecoration(
        suffix: const FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
        ),
        label: Text(
          'Pesquisar',
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
