import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/views/login/components/login_form_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: _buildDecoration(),
      child: const LoginForm(),
    );
  }

  _buildDecoration() {
    return const BoxDecoration();
  }
}
