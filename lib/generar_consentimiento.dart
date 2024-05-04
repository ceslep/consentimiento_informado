import 'package:consentimiento_informado/date_picker.dart';
import 'package:consentimiento_informado/paciente_model.dart';
import 'package:consentimiento_informado/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'texto.dart';

class GenerarConsentimiento extends StatefulWidget {
  final Paciente paciente;
  const GenerarConsentimiento({super.key, required this.paciente});

  @override
  State<GenerarConsentimiento> createState() => _GenerarConsentimientoState();
}

class _GenerarConsentimientoState extends State<GenerarConsentimiento> {
  final TextEditingController _fechaController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Generar Consentimiento'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
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
                paciente: widget.paciente,
                fecha: _fechaController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
