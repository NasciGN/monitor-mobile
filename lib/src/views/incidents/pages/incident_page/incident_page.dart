import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/models/event.dart';
import 'package:monitor_mobile/src/views/incidents/components/event_acknowledges_chat_card.dart';
import 'package:monitor_mobile/src/views/incidents/pages/incident_info_page.dart';
import 'package:monitor_mobile/src/views/incidents/pages/incidente_update_page.dart';

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
          Get.offNamed('/incidents_list_page');
        },
      ),
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: _buildPadding(),
          decoration: _buildContainerDecoration(context),
          child: _buildPageSelector(),
        ),
        const SizedBox(height: defaultpd * 2),
        if (_currentIndex == 0)
          Expanded(
            child: SingleChildScrollView(
              child: IncidentInfoPage(
                event: event,
              ),
            ),
          )
        else
          Expanded(
            child: Container(
              padding: _buildPadding(),
              decoration: _buildContainerDecoration(context),
              child: event.acknowledges.isEmpty
                  ? SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.triangleExclamation,
                            size: defaultpd * 4,
                          ),
                          const SizedBox(
                            height: defaultpd,
                          ),
                          Text(
                            'Nenhuma ação efetuada.',
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: event.acknowledges.length,
                      itemBuilder: (context, index) {
                        return EventAcknowledgesChatCard(
                            acknowledged: event.acknowledges[index]);
                      },
                    ),
            ),
          ),
        if (_currentIndex == 1) ...[
          const SizedBox(height: defaultpd * 2),
          IncidentUpdatePage(
            event: event,
          ),
        ],
      ],
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

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
