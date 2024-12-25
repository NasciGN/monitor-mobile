import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/views.dart';

List<GetPage<dynamic>> customGetPages = [
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/dashboard', page: () => const DashboardPage()),
  GetPage(name: '/hosts', page: () => const HostsPage()),
  GetPage(name: '/host_page', page: () => const HostPage()),
  GetPage(name: '/host_itens', page: () => const ItemsPage()),
  GetPage(name: '/host_incidents', page: () => const HostIncidentsPage()),
  GetPage(name: '/host_charts', page: () => const HostCharts()),
  GetPage(name: '/item_page', page: () => const ItemPage()),
  GetPage(name: '/chart', page: () => const Chart()),
  GetPage(name: '/templates', page: () => const TemplatesPage()),
  GetPage(name: '/template_page', page: () => const TemplatePage()),
  GetPage(name: '/problems', page: () => const ProblemsPage()),
  GetPage(name: '/incidents', page: () => const IncidentsPage()),
  GetPage(name: '/incident_page', page: () => const IncidentPage()),
  GetPage(name: '/groups', page: () => const GroupsPage()),
  GetPage(name: '/shortly', page: () => const ShortlyPage()),
];
