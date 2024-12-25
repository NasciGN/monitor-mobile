import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostInterfaceFormController extends GetxController {
  bool isEdit = false;
  TextEditingController ip = TextEditingController();
  TextEditingController dns = TextEditingController();
  TextEditingController port = TextEditingController();
  @override
  onClose() {
    ip.dispose();
    dns.dispose();
    port.dispose();
  }
}
