import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';
import 'package:monitor_mobile/src/views/login/components/form/login_form_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _buildDecoration(),
      child: const LoginForm(),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
        color: darkScdBgColor, borderRadius: BorderRadius.circular(15));
  }
}
