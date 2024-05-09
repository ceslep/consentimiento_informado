// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:consentimiento_informado/configuracion.dart';
import 'package:consentimiento_informado/date_picker.dart';
import 'package:consentimiento_informado/paciente_model.dart';
import 'package:consentimiento_informado/representacion.dart';
import 'package:consentimiento_informado/signature.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'texto.dart';

class GenerarConsentimiento extends StatefulWidget {
  final Paciente paciente;

  const GenerarConsentimiento({super.key, required this.paciente});

  @override
  State<GenerarConsentimiento> createState() => _GenerarConsentimientoState();
}

class _GenerarConsentimientoState extends State<GenerarConsentimiento> {
  String firma = '';
  late final String url;
  final TextEditingController _fechaController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  late List<Map<String, String>> representacion;
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
    configuracion.add({'firma': await loadData('firma')});
    url = await loadData('url');
    return configuracion;
  }

  Future<bool> _launchInBrowser(Uri url) async {
    bool result = false;
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      result = false;
      throw Exception('Could not launch $url');
    } else {
      result = true;
    }
    return result;
  }

  Future<void> generarConsentimiento(String json) async {
    Uri urlpdf = Uri.parse("${url}php/generacons.php");
    String bodyData = jsonEncode({"fecha": _fechaController.text});
    try {
      final response = await http.post(urlpdf, body: bodyData);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    representacion = [
      {"identificacionPaciente": "1010125403"},
      {"nombresPaciente": "Yenifer Idarraga Gutierrez"},
      {"idRepresentante": "9695141"},
      {"nombresRepresentante": "César Leandro Patiño Vélez"},
      {"direccionRepresentante": "Guatica Risaralda"},
      {"telefonoRepresentante": "3218552353"},
      {"eps": "Fiduprevisora"},
      {"prepagada": "N/A"},
      {"tratamiento": "Ortodoncia con Brackets Cerámicos"},
      {"lesiones": "Daños en las encias y en los dientes"},
      {"medicamentos": "Acetaminofen, Ibuprofeno, Naproxeno"},
      {"consecuencias": "Alteración de la mordida"},
      {"alternativas": "Retratamiento Odontológico"},
      {"testigo": "César leandro Patiño Vélez"},
      {"direccionTestigo": "Guatica Risaralda"},
      {"telefonoTestigo": "3218552353"},
      {"personaAcontactar": "César leandro Patiño Vélez"},
      {"telefonoContacto": "3218552353"},
      {"profesional": ""},
      {"direccionProfesional": ""},
      {"telefonoProfesional": ""},
      {"firma": ""},
      {"firmaProfesional": ""},
      {"fecha": _fechaController.text},
    ];
    getConfiguracion().then((value) {
      configuracion = value;
      representacion[18]["profesional"] = configuracion[0]["profesional"]!;
      representacion[19]["direccionProfesional"] =
          configuracion[1]["direccion"]!;
      representacion[20]["telefonoProfesional"] = configuracion[2]["telefono"]!;
      representacion[22]["firmaProfesional"] = configuracion[3]["firma"]!;
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
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                String json = "";
                for (var dato in representacion) {
                  String key = dato.keys.first.toString();
                  String value = dato.values.first.toString();
                  json += "'$key':'$value',";
                }
                json = json.substring(0, json.length - 1);
                json = "{$json}";
                await generarConsentimiento(json);
                /* String ucons =
                    "${url}php/consentimientos/consentimiento_${representacion[0]["identificacionPaciente"]}.pdf";
                await _launchInBrowser(Uri.parse(ucons)); */
              },
              icon: const Icon(Icons.document_scanner_sharp,
                  color: Color.fromARGB(255, 199, 237, 255)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Configuracion()),
                );
              },
              icon: const Icon(Icons.settings, color: Colors.yellowAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              onPressed: () async {
                var sfirma = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signature(),
                    ));
                print(sfirma);
                if (sfirma != null) {
                  print(sfirma);
                  if (sfirma != '') {
                    representacion[21]['firma'] = sfirma;
                    setState(() => firma = sfirma);
                  }
                }
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.yellowAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 1.0, right: 6),
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
                color: Colors.yellowAccent,
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
