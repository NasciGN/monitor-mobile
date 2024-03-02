import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/hosts/host_detail/components/form/host_form.dart';

import '../../../../../models/host.dart';

class HostDetailForm extends StatelessWidget {
  HostDetailForm({super.key, required this.host});

  final Host host;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomHostForm(host: host.host),
        CustomHostNameForm(name: host.name)
      ]),
    );
  }
}
