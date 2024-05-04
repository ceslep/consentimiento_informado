// To parse this JSON data, do
//
//     final Paciente = PacienteFromJson(jsonString);

import 'dart:convert';

Paciente pacienteFromJson(String str) => Paciente.fromJson(json.decode(str));

String pacienteToJson(Paciente data) => json.encode(data.toJson());

class Paciente {
  final String? nombres;
  final String? identificacion;
  final String? tipo;
  final String? descripcion;
  final String? estadoPaciente;
  final String? entidad;
  final String? direccion;
  final String? ciudad;
  final String? telefono;
  final String? n1;
  final String? n2;
  final String? a1;
  final String? a2;

  Paciente({
    this.nombres,
    this.identificacion,
    this.tipo,
    this.descripcion,
    this.estadoPaciente,
    this.entidad,
    this.direccion,
    this.ciudad,
    this.telefono,
    this.n1,
    this.n2,
    this.a1,
    this.a2,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        nombres: json["nombres"],
        identificacion: json["identificacion"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        estadoPaciente: json["estado_paciente"],
        entidad: json["entidad"],
        direccion: json["direccion"],
        ciudad: json["ciudad"],
        telefono: json["telefono"],
        n1: json["n1"],
        n2: json["n2"],
        a1: json["a1"],
        a2: json["a2"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "identificacion": identificacion,
        "tipo": tipo,
        "descripcion": descripcion,
        "estado_paciente": estadoPaciente,
        "entidad": entidad,
        "direccion": direccion,
        "ciudad": ciudad,
        "telefono": telefono,
        "n1": n1,
        "n2": n2,
        "a1": a1,
        "a2": a2,
      };
}
