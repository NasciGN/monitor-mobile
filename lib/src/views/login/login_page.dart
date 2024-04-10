import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

import 'package:monitor_mobile/src/views/login/components/form/login_widget.dart';
import 'package:monitor_mobile/src/views/login/components/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: darkBgColor,
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(),
            SizedBox(
              height: 40,
            ),
            LoginWidget()
          ],
        ),
      ),
    );
  }
}
