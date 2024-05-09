import 'package:flutter/material.dart';

class Representacion extends StatelessWidget {
  final List<Map<String, String>> representacion;
  const Representacion({super.key, required this.representacion});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> representacionOut = representacion;
    final TextEditingController identificacionController =
        TextEditingController(text: representacion[0]["identificacion"]);
    final TextEditingController nombresController =
        TextEditingController(text: representacion[1]["nombres"]);
    final TextEditingController direccionController =
        TextEditingController(text: representacion[2]["direccion"]);
    final TextEditingController telefonoController =
        TextEditingController(text: representacion[3]["telefono"]);
    final TextEditingController epsController =
        TextEditingController(text: representacion[4]["eps"]);
    final TextEditingController prepagadaController =
        TextEditingController(text: representacion[5]["prepagada"]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Representación de:'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: identificacionController,
                  decoration: const InputDecoration(
                    labelText: 'Identificación',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nombresController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del representado',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: direccionController,
                  decoration: const InputDecoration(
                    labelText: 'Dirección Representante Legal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: telefonoController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono representante legal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: epsController,
                  decoration: const InputDecoration(
                    labelText: 'EPS o ARS',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: prepagadaController,
                  decoration: const InputDecoration(
                    labelText: 'Empresa de Salud Prepagada',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (_) => Theme.of(context).colorScheme.secondary),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Asignar'),
                onPressed: () async {
                  if (identificacionController.text.isEmpty ||
                      nombresController.text.isEmpty) {
                    showDialog<AlertDialog>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text(
                                  "Todos los campos son obligatorios."),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Aceptar"),
                                )
                              ],
                            ));
                  } else {
                    representacionOut[0]['identificacion'] =
                        identificacionController.text;
                    representacionOut[1]['nombres'] = nombresController.text;
                    representacionOut[2]['direccion'] =
                        direccionController.text;
                    representacionOut[3]['telefono'] = telefonoController.text;
                    representacionOut[4]['eps'] = epsController.text;
                    representacionOut[5]['prepagada'] =
                        prepagadaController.text;
                    Navigator.pop(context, representacionOut);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
