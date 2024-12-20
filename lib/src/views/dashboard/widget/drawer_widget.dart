import 'package:expansion_tile_group/expansion_tile_group.dart';
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultpd * 4, horizontal: defaultpd * 2),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildListOption(context, 'Dashboard',
                      FontAwesomeIcons.chartLine, 'dashboard'),
                  ExpansionTileGroup(
                    toggleType: ToggleType.expandOnlyCurrent,
                    children: [
                      _buildExpansionTileMonitoring(context),
                      _buildExpansionTileServices(context),
                      _buildExpansionTileCollectedData(context),
                      _buildExpansionTileUsers(context)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: Text(
                'Desconectar',
                style: Theme.of(context).textTheme.titleSmall,
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

  ListTile _buildListOption(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
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
      onTap: () {
        Navigator.of(context).pop();
        Get.offNamed(route);
      },
    );
  }

  ExpansionTileItem _buildExpansionTileMonitoring(BuildContext context) {
    return ExpansionTileItem(
      title: Text(
        'Monitoramento',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: const Icon(
        FontAwesomeIcons.eye,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Incidentes', '/incidents_list_page'),
        _buildListItem(context, 1, 'Hosts', '/hosts'),
      ],
    );
  }

  ExpansionTileItem _buildExpansionTileServices(BuildContext context) {
    return ExpansionTileItem(
      title: Text(
        'Serviços',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: const Icon(
        FontAwesomeIcons.diagramProject,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Serviços', '/shortly'),
        _buildListItem(context, 1, 'SLA', '/shortly'),
      ],
    );
  }

  ExpansionTileItem _buildExpansionTileCollectedData(BuildContext context) {
    return ExpansionTileItem(
      title: Text(
        'Dados coletados',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: const Icon(
        FontAwesomeIcons.arrowDownShortWide,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Grupos de Modelos', '/shortly'),
        _buildListItem(context, 1, 'Grupos de Hosts', '/shortly'),
        _buildListItem(context, 2, 'Templates', '/shortly'),
      ],
    );
  }

  ExpansionTileItem _buildExpansionTileUsers(BuildContext context) {
    return ExpansionTileItem(
      title: Text(
        'Usuários',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: const Icon(
        FontAwesomeIcons.userGroup,
        color: Colors.white,
      ),
      children: [
        _buildListItem(context, 0, 'Grupos de usuários', '/shortly'),
        _buildListItem(context, 1, 'Usuários', '/shortly'),
      ],
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, String title, String route) {
    return Card(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultpd, vertical: defaultpd / 2),
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Get.offNamed(route);
            }));
  }
}
