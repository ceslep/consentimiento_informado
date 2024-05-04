import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snack/snack.dart';

class Configuracion extends StatefulWidget {
  const Configuracion({super.key});

  @override
  State<Configuracion> createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  String url = '';
  final TextEditingController urlController =
      TextEditingController(text: 'http://192.');
  final bar = const SnackBar(
    content: Text(
      'Configuración guardada!',
      style: TextStyle(color: Colors.lime),
    ),
  );
  @override
  void initState() {
    super.initState();
    loadUrl();
  }

  Future<void> loadUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      url = prefs.getString('url') ?? '';
      urlController.text = url;
    });
  }

  Future<void> saveUrl(String userurl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('url', url);
    setState(() {
      url = userurl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 202, 253),
        title: const Text('Configuración'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: urlController,
              onChanged: (value) => saveUrl(value),
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dirección IP del servidor',
                hintText: 'Ingrese Url',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              saveUrl(urlController.text);
              bar.show(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
