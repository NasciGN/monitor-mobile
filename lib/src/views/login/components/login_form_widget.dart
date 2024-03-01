import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/user/user_api.dart';
import 'package:monitor_mobile/src/views/login/components/server_url_dialog_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String serverResult;
  final UserApi userapi = Get.find<UserApi>();
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserField(),
            const SizedBox(
              height: 30,
            ),
            _buildPassField(),
            const SizedBox(
              height: 16,
            ),
            _buildServerRegistrationBtn(),
            _buildLoginBtn()
          ],
        ),
      ),
    );
  }

  _buildUserField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      controller: _controllerUser,
      decoration: _buildTextFieldUserdDecoration('Usuário'),
    );
  }

  _buildPassField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      controller: _controllerPass,
      obscureText: isObscure ? true : false,
      decoration: _buildTextFieldPassdDecoration('Senha'),
    );
  }

  _buildTextFieldUserdDecoration(String label) {
    return InputDecoration(
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.white), // Define a cor da borda quando não selecionado
        ),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .tertiary), // Define a cor da borda quando selecionado
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }

  _buildTextFieldPassdDecoration(String label) {
    return InputDecoration(
        suffixIcon: Align(
          widthFactor: 3.0,
          heightFactor: 1.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: isObscure
                ? const FaIcon(
                    FontAwesomeIcons.eye,
                    color: Colors.white,
                    size: 20,
                  )
                : const FaIcon(
                    FontAwesomeIcons.solidEye,
                    color: Colors.white,
                    size: 20,
                  ),
          ),
        ),
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.white), // Define a cor da borda quando não selecionado
        ),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .tertiary), // Define a cor da borda quando selecionado
        ),
        focusColor: Theme.of(context).colorScheme.tertiary);
  }

  _buildServerRegistrationBtn() {
    return Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () async {
            final result =
                await Get.dialog<String>(ServerRegistration(_controllerUrl));

            setState(() {
              serverResult = result!;
            });
          },
          child: _buildTextBtn(),
        ));
  }

  _buildTextBtn() {
    return const SizedBox(
      height: 50,
      width: 200,
      child: Text(
        'Cadastrar Servidor',
        style: TextStyle(color: Colors.white),
      ),
    );
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
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
            child: Text(
          'Acessar',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
      if (userapi.apicode.isNotEmpty) {
        Get.offNamed("/home");
      }
    }
  }

  _buildCallLoginApi() async {
    return await userapi.login(
        _controllerUser.text, _controllerPass.text, serverResult);
  }
}
