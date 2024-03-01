import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

class ServerRegistration extends StatelessWidget {
  final Rx<TextEditingController> controllerUrl;
  const ServerRegistration(this.controllerUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _urlController = TextEditingController();
    return AlertDialog(
      title: const Text(
        'Configurar Servidor',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: darkScdBgColor,
      shape: const BeveledRectangleBorder(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            controller: _urlController,
            decoration: _buildTextFormFieldDecoration('URL do Servidor'),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            String url = _urlController.text;
            Get.back(result: url);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  _buildTextFormFieldDecoration(String label) {
    return InputDecoration(
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.white), // Define a cor da borda quando não selecionado
        ),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: darkBtnColor), // Define a cor da borda quando selecionado
        ),
        focusColor: darkBtnColor);
  }
}
