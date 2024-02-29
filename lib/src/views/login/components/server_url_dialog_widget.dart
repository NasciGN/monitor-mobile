import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerRegistration extends StatelessWidget {
  final Rx<TextEditingController> controllerUrl;
  const ServerRegistration(this.controllerUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _urlController = TextEditingController();
    return AlertDialog(
      title: const Text('Configurar Servidor'),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _urlController,
            decoration: const InputDecoration(labelText: 'URL do Servidor'),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
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
}
