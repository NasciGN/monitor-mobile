import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/host.dart';
import 'package:monitor_mobile/src/views/views.dart';

List<GetPage<dynamic>> customGetPages = [
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/host_page', page: () => HostPage())
];
