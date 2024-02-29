import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/themes/custom_dark_theme.dart';

import 'package:monitor_mobile/src/views/login/components/login_widget.dart';
import 'package:monitor_mobile/src/views/login/components/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return const Column(
      children: [LogoWidget(), LoginWidget()],
    );
  }
}
