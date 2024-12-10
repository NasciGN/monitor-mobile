import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/views.dart';

List<GetPage<dynamic>> customGetPages = [
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/dashboard', page: () => const DashboardPage()),
  GetPage(name: '/hosts', page: () => const HostsPage()),
  GetPage(name: '/host_page', page: () => const HostPage()),
  GetPage(name: '/host_itens', page: () => const HostItensListPage()),
  GetPage(name: '/item_page', page: () => const ItemPage()),
  GetPage(name: '/item_graph', page: () => const Chart()),
  GetPage(name: '/host_incidents', page: () => const ProblemsListPage()),
  GetPage(name: '/host_graphs', page: () => const HostGraphs()),
  GetPage(name: '/problems_page', page: () => const ProblemsPage()),
  GetPage(name: '/incidents_list_page', page: () => const IncidentsListPage()),
  GetPage(name: '/incident_page', page: () => const IncidentPage()),
  GetPage(name: '/shortly', page: () => const ShortlyPage()),
];
