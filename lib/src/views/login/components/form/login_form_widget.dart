import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/user/user_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String serverResult;
  final UserApi userapi = Get.find<UserApi>();
  final _formKey = GlobalKey<FormState>();
  final _controllerUrl = TextEditingController();
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
              height: 30,
            ),
            _buildServerField(),
            const SizedBox(
              height: 16,
            ),
            // _buildServerRegistrationBtn(),
            _buildLoginBtn()
          ],
        ),
      ),
    );
  }

  _buildUserField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: _controllerUser,
      decoration: _buildTextFieldDecoration('Usuário', false),
    );
  }

  _buildServerField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: _controllerUrl,
      decoration: _buildTextFieldDecoration('Servidor', false),
    );
  }

  _buildPassField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: _controllerPass,
      obscureText: isObscure ? true : false,
      decoration: _buildTextFieldDecoration('Senha', true),
    );
  }

  _buildTextFieldDecoration(String label, bool isPass) {
    return InputDecoration(
        suffixIcon: isPass == true
            ? Align(
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
                ))
            : const SizedBox.shrink(),
        label: Text(
          label,
          style: _buildTextLabelStyle(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: _buildTextLabelStyle(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Colors.white);
  }

  _buildTextLabelStyle() {
    return Theme.of(context).textTheme.labelMedium;
  }

  _buildRegisterServerBTn() {
    return SizedBox(
      height: 60,
      width: 500,
      child: Text(
        'Cadastrar Servidor',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  _buildLoginBtn() {
    return ElevatedButton(
        onPressed: () => _buildValidateForm(),
        child: const Text(
          'Acessar',
          style: TextStyle(color: Colors.white),
        ));
  }

  _buildValidateForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (mounted) {
          isLoading = true;
        }
      });
      try {
        await _buildCallLoginApi();

        setState(() {
          if (mounted) {
            isLoading = false;
          }
        });
        if (userapi.apicode.isNotEmpty) {
          Get.offNamed("/dashboard");
        }
      } catch (e) {
        setState(() {
          if (mounted) {
            isLoading = false;
          }
        });
      }
    }
  }

  _buildCallLoginApi() async {
    return await userapi.login(
        _controllerUser.text, _controllerPass.text, _controllerUrl.text);
  }
}
