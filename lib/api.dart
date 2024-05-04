// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:consentimiento_informado/paciente_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<List<Paciente>> getPacientes(String criterio) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String lurl = prefs.getString('url') ?? '';
  final Uri url = Uri.parse('${lurl}busquedaPacientes2.php');
  final String bodyData = jsonEncode({"criterio": criterio});
  Map<String, String> headers = {
    'Content-Type': 'application/json', // Tipo de contenido JSON
    // Otros encabezados si es necesario
  };

  late final http.Response response;
  try {
    response = await http.post(url, body: bodyData, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> datosPaciente = json.decode(response.body);
      return datosPaciente.map((p) => Paciente.fromJson(p)).toList();
    }
  } catch (e) {
    print(e);
    return [];
  }
  return [];
}
