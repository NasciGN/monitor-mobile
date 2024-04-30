import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserApi userapi = Get.find<UserApi>();
    return Drawer(
      shape: const LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultpd * 4, horizontal: defaultpd * 2),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildListOption(
                      context, 'Dashboard', FontAwesomeIcons.chartLine),
                  _buildExpansionTileMonitoring(context),
                  const SizedBox(height: 5),
                  _buildExpansionTileServices(context),
                  const SizedBox(height: 5),
                  _buildExpansionTileCollectedData(context),
                  const SizedBox(height: 5),
                  _buildExpansionTileUsers(context),
                ],
              ),
            ),
            const SizedBox(height: 5),
            _buildListOption(context, 'Ajuda', FontAwesomeIcons.question),
            const SizedBox(height: 5),
            ListTile(
              title: Text(
                'Desconectar',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              leading: const Icon(
                FontAwesomeIcons.powerOff,
                color: Colors.white,
              ),
              trailing: const Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
                size: 15,
              ),
              onTap: () {
                userapi.logout();
                Get.offNamed('/login');
              },
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildListOption(BuildContext context, String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      trailing: const Icon(
        FontAwesomeIcons.chevronRight,
        color: Colors.white,
        size: 15,
      ),
      onTap: () {},
    );
  }

  ExpansionTile _buildExpansionTileMonitoring(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Monitoramento',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      leading: const Icon(
        FontAwesomeIcons.eye,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Incidentes', ''),
        _buildListItem(context, 1, 'Hosts', '/home'),
        _buildListItem(context, 2, 'Dados recentes', ''),
      ],
    );
  }

  ExpansionTile _buildExpansionTileServices(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Serviços',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      leading: const Icon(
        FontAwesomeIcons.diagramProject,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Serviços', ''),
        _buildListItem(context, 1, 'SLA', ''),
      ],
    );
  }

  ExpansionTile _buildExpansionTileCollectedData(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Dados coletados',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      leading: const Icon(
        FontAwesomeIcons.arrowDownShortWide,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Grupos de Modelos', ''),
        _buildListItem(context, 1, 'Grupos de Hosts', ''),
        _buildListItem(context, 2, 'Templates', ''),
      ],
    );
  }

  ExpansionTile _buildExpansionTileUsers(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Usuários',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      leading: const Icon(
        FontAwesomeIcons.userGroup,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Grupos de usuários', ''),
        _buildListItem(context, 1, 'Usuários', ''),
      ],
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, String title, String route) {
    return Card(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultpd, vertical: defaultpd / 2),
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(route);
            }));
  }
}
