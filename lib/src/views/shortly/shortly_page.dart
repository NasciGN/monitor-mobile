import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_mobile/src/controllers/backgroud_task/backgroud_service.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:monitor_mobile/src/views/dashboard/components/drawer_widget.dart';

class ShortlyPage extends StatelessWidget {
  const ShortlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
      drawer: const SideMenu(),
      body: _buildBody(),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(defaultpd * 2);

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(
        'Em breve',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  _buildBody() {
    return Padding(
      padding: _buildPadding(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.personDigging),
            const Text('Página em construção'),
            ElevatedButton(
              onPressed: () async {
                final incidents = await BackgroundService()
                    .problemDataController
                    .fetchProblems();
                print(
                    "🔍 Teste Manual: ${incidents.length} incidentes encontrados.");
              },
              child: Text("Testar API Zabbix"),
            )
          ],
        ),
      ),
    );
  }
}
