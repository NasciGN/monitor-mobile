import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/views/login/components/server_url_dialog_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllerUrl = TextEditingController().obs;
  final _controllerUser = TextEditingController();
  final _controllerPass = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildUserField(),
          _buildPassField(),
          _buildServerRegistrationBtn(),
          _buildLoginBtn()
        ],
      ),
    );
  }

  _buildUserField() {
    return TextFormField(
      controller: _controllerUser,
      decoration: const InputDecoration(label: Text('Usuário')),
    );
  }

  _buildPassField() {
    return TextFormField(
      controller: _controllerPass,
      obscureText: isObscure ? true : false,
      decoration: const InputDecoration(label: Text('Senha')),
    );
  }

  _buildServerRegistrationBtn() {
    return Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () async {
            final result = _buildGetUrlFromDialog;
            print(result);
          },
          child: Container(
            height: 20,
            width: 70,
            child: const Text(
              'Cadastrar Servidor',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  _buildLoginBtn() {
    return GestureDetector(
      onTap: () async {
        _buildValidateForm();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 111, 116, 111),
            borderRadius: BorderRadius.circular(2)),
        child: const Center(
            child: Text(
          'Acessar',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  _buildValidateForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      _buildCallLoginApi();

      setState(() {
        isLoading = false;
      });
      Get.offNamed("/home_dashboard");
    }
  }

  _buildCallLoginApi() {
    return '';
  }

  _buildGetUrlFromDialog() {
    return Get.dialog<String>(ServerRegistration(_controllerUrl));
  }
}
