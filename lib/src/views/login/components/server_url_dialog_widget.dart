import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/colors/custom_colors.dart';

class ServerRegistration extends StatelessWidget {
  final Rx<TextEditingController> controllerUrl;
  const ServerRegistration(this.controllerUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController = TextEditingController();
    return AlertDialog(
      title: Text(
        'Configurar Servidor',
        style: Theme.of(context).textTheme.labelMedium,
      ),
      backgroundColor: darkScdBgColor,
      shape: const BeveledRectangleBorder(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            cursorColor: Colors.white,
            style: Theme.of(context).textTheme.labelMedium,
            controller: urlController,
            decoration:
                _buildTextFormFieldDecoration('URL do Servidor', context),
          ),
          const SizedBox(height: 10),
        ],
      ),
      alignment: Alignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String url = urlController.text;
            Get.back(result: url);
          },
          child: Text(
            'Salvar',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }

  _buildTextFormFieldDecoration(String label, context) {
    return InputDecoration(
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors.white), // Define a cor da borda quando não selecionado
        ),
        labelStyle: Theme.of(context).textTheme.labelMedium,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: darkBtnColor), // Define a cor da borda quando selecionado
        ),
        focusColor: darkBtnColor);
  }
}
