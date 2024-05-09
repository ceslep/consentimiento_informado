import 'package:flutter/material.dart';

class Representacion extends StatefulWidget {
  final List<Map<String, String>> representacion;
  const Representacion({super.key, required this.representacion});

  @override
  State<Representacion> createState() => _RepresentacionState();
}

class _RepresentacionState extends State<Representacion> {
  late List<Map<String, String>> representacionOut;
  late final TextEditingController identificacionController;
  late final TextEditingController nombresController;
  late final TextEditingController idRepresentanteController;
  late final TextEditingController nombresRepresentanteController;
  late final TextEditingController direccionRepresentanteController;
  late final TextEditingController telefonoRepresentanteController;
  late final TextEditingController epsController;
  late final TextEditingController prepagadaController;
  late final TextEditingController tratamientoController;
  late final TextEditingController lesionesController;
  late final TextEditingController medicamentosController;
  late final TextEditingController consecuenciasController;
  late final TextEditingController alternativasController;
  late final TextEditingController testigoController;
  late final TextEditingController direccionTestigoController;
  late final TextEditingController telefonoTestigoController;
  late final TextEditingController personaAContactarController;
  late final TextEditingController telefonoContactoController;

  @override
  void initState() {
    super.initState();
    representacionOut = widget.representacion;
    identificacionController = TextEditingController(
        text: widget.representacion[0]["identificacionPaciente"]);
    nombresController = TextEditingController(
        text: widget.representacion[1]["nombresPaciente"]);
    idRepresentanteController = TextEditingController(
        text: widget.representacion[2]["idRepresentante"]);
    nombresRepresentanteController = TextEditingController(
        text: widget.representacion[3]["nombresRepresentante"]);
    direccionRepresentanteController = TextEditingController(
        text: widget.representacion[4]["direccionRepresentante"]);
    telefonoRepresentanteController = TextEditingController(
        text: widget.representacion[5]["telefonoRepresentante"]);
    epsController =
        TextEditingController(text: widget.representacion[6]["eps"]);
    prepagadaController =
        TextEditingController(text: widget.representacion[7]["prepagada"]);
    tratamientoController =
        TextEditingController(text: widget.representacion[8]["tratamiento"]);
    lesionesController =
        TextEditingController(text: widget.representacion[9]["lesiones"]);
    medicamentosController =
        TextEditingController(text: widget.representacion[10]["medicamentos"]);
    consecuenciasController =
        TextEditingController(text: widget.representacion[11]["consecuencias"]);
    alternativasController =
        TextEditingController(text: widget.representacion[12]["alternativas"]);
    testigoController =
        TextEditingController(text: widget.representacion[13]["testigo"]);
    direccionTestigoController = TextEditingController(
        text: widget.representacion[14]["direccionTestigo"]);
    telefonoTestigoController = TextEditingController(
        text: widget.representacion[15]["telefonoTestigo"]);
    personaAContactarController = TextEditingController(
        text: widget.representacion[16]["personaAcontactar"]);
    telefonoContactoController = TextEditingController(
        text: widget.representacion[17]["telefonoContacto"]);
  }

  List<Map<String, String>> asignarRepresentacion() {
    representacionOut[0]['identificacionPaciente'] =
        identificacionController.text;
    representacionOut[1]['nombresPaciente'] = nombresController.text;
    representacionOut[2]['idRepresentante'] = idRepresentanteController.text;
    representacionOut[3]['nombresRepresentante'] =
        nombresRepresentanteController.text;
    representacionOut[4]['direccionRepresentante'] =
        direccionRepresentanteController.text;
    representacionOut[5]['telefonoRepresentante'] =
        telefonoRepresentanteController.text;
    representacionOut[6]['eps'] = epsController.text;
    representacionOut[7]['prepagada'] = prepagadaController.text;
    representacionOut[8]['tratamiento'] = tratamientoController.text;
    representacionOut[9]['lesiones'] = lesionesController.text;
    representacionOut[10]['medicamentos'] = medicamentosController.text;
    representacionOut[11]['consecuencias'] = consecuenciasController.text;
    representacionOut[12]['alternativas'] = alternativasController.text;
    representacionOut[13]['testigo'] = medicamentosController.text;
    representacionOut[14]['direccionTestigo'] = direccionTestigoController.text;
    representacionOut[15]['telefonoTestigo'] = telefonoTestigoController.text;
    representacionOut[16]['personaAContactar'] =
        personaAContactarController.text;
    representacionOut[17]['telefonoContacto'] = telefonoContactoController.text;
    return representacionOut;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Información:'),
        leading: IconButton(
          onPressed: () {
            asignarRepresentacion();
            Navigator.pop(context, representacionOut);
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
                    labelText: 'Identificación del paciente',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nombresController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del paciente',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idRepresentanteController,
                  decoration: const InputDecoration(
                    labelText: 'Identificación Representante Legal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nombresRepresentanteController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre representante legal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: direccionRepresentanteController,
                  decoration: const InputDecoration(
                    labelText: 'Dirección Representante',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: telefonoRepresentanteController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono Representante Legal',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: tratamientoController,
                  decoration: const InputDecoration(
                    labelText: 'Tratamiento',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lesionesController,
                  decoration: const InputDecoration(
                    labelText: 'Posibles Lesiones o daños colaterales',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: medicamentosController,
                  decoration: const InputDecoration(
                    labelText: 'Medicamentos',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: consecuenciasController,
                  decoration: const InputDecoration(
                    labelText: 'Consecuencias',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: alternativasController,
                  decoration: const InputDecoration(
                    labelText: 'Alternativas',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: testigoController,
                  decoration: const InputDecoration(
                    labelText: 'Testigo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: direccionTestigoController,
                  decoration: const InputDecoration(
                    labelText: 'Dirección testigo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: telefonoTestigoController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono Testigo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: personaAContactarController,
                  decoration: const InputDecoration(
                    labelText: 'Persona a Contactar',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: telefonoContactoController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono Persona a Contactar',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
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
                      asignarRepresentacion();
                      Navigator.pop(context, representacionOut);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
