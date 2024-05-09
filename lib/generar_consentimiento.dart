// ignore_for_file: avoid_print

import 'package:consentimiento_informado/date_picker.dart';
import 'package:consentimiento_informado/paciente_model.dart';
import 'package:consentimiento_informado/representacion.dart';
import 'package:consentimiento_informado/signature.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'texto.dart';

class GenerarConsentimiento extends StatefulWidget {
  final Paciente paciente;

  const GenerarConsentimiento({super.key, required this.paciente});

  @override
  State<GenerarConsentimiento> createState() => _GenerarConsentimientoState();
}

class _GenerarConsentimientoState extends State<GenerarConsentimiento> {
  String firma = '';
  final TextEditingController _fechaController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  List<Map<String, String>> representacion = [
    {"identificacion": ""},
    {"nombres": ""},
    {"direccion": ""},
    {"telefono": ""},
    {"eps": ""},
    {"prepagada": ""}
  ];
  List<Map<String, String>> configuracion = [
    {"profesional": ""},
    {"direccion": ""},
    {"telefono": ""}
  ];

  Future<String> loadData(
    String key,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<List<Map<String, String>>> getConfiguracion() async {
    List<Map<String, String>> configuracion = [];
    configuracion.add({'profesional': await loadData('profesional')});
    configuracion.add({'direccion': await loadData('direccion')});
    configuracion.add({'telefono': await loadData('telefono')});
    return configuracion;
  }

  @override
  void initState() {
    super.initState();
    getConfiguracion().then((value) {
      configuracion = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Generar Consentimiento',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              onPressed: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signature(),
                    ));

                if (result != null) {
                  if (result['firma'] != '') {
                    setState(() => firma = result['firma']);
                  }
                }
                print(firma);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: IconButton(
              onPressed: () async {
                representacion = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Representacion(
                      representacion: representacion,
                    ),
                  ),
                );
                print(representacion);
                setState(() {});
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildDatePicker(context, _fechaController, 'Fecha'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                configuracion: configuracion,
                paciente: widget.paciente,
                fecha: _fechaController.text,
                representacion: representacion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
