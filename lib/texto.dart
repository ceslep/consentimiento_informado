// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:consentimiento_informado/paciente_model.dart';
import 'package:flutter/material.dart';

class Texto extends StatefulWidget {
  final Paciente paciente;
  final String fecha;
  final List<Map<String, String>> representacion;
  final List<Map<String, String>> configuracion;
  const Texto({
    super.key,
    required this.paciente,
    required this.fecha,
    required this.representacion,
    required this.configuracion,
  });

  @override
  State<Texto> createState() => _TextoState();
}

class _TextoState extends State<Texto> {
  List<TextSpan> generaLineas() {
    List<TextSpan> textSpans = [
      TextSpan(
        text:
            'AUTORIZACION Y CONSENTIMIENTO PARA LA EJECUCIÓN DE UN PROCEDIMIENTO ODONTOLOGICO\n',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: '\nFecha: ${widget.fecha}\n\n'),
      TextSpan(
          text:
              'Yo, ${widget.paciente.nombres} identificado con la CC No. ${widget.paciente.identificacion} o en nombre y representación de\n'),
      TextSpan(text: widget.representacion[1]["nombres"]),
      TextSpan(
          text:
              ' con documento de identidad N° ${widget.representacion[0]["identificacion"]} quien no cuenta capacidad decisoria, expresamente manifiesto:\n\n'),
      TextSpan(
        text: '[1] ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text:
              'Que he recibido por parte del Doctor explicación clara, completa, precisa y comprensible de los procedimientos a los que seré sometido, los resultados esperados y los beneficios de distinto orden por razón del siguiente tratamiento:\n\n'),
      TextSpan(
        text: '[2] ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text:
              'Que igualmente he recibido Información y acepto los riesgos inherentes a dicho tratamiento: asi como las posibles lesiones o daños colaterales o secuelas que este puede ocasionar, que en general consisten en:\n\n'),
      TextSpan(
        text: '[3]',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text:
              'Que se me ha suministrado información detallada sobre los cuidados que debo tener dentro de la fase de ejecución del procedimiento, el pos tratamiento y los fármacos o medicinas que debo ingerir, los cuales se resumen en los siguientes:\n\n'),
      TextSpan(
        text: '[4]',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text:
              'Se me enteró de las consecuencias posibles en caso de desatender las recomendaciones anteriores que sucintamente pueden describirse asi:\n\n'),
      TextSpan(
        text: '[5]',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text:
              'Que he sido debidamente notificado sobre las opciones y alternativas de otros procedimientos, sus costos y resultados, de forma tal que expreso contar con toda la información requerida para tomar una decisión consciente y deliberada. Dichas alternativas en resumen son:\n\n'),
      TextSpan(
        text: '[6]',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            'He contado con el tiempo necesario para madurar las decisiones contenidas en el presente documento: haciendo constar que me fue explicado el derecho que me asiste a arrepentirme o cambiar de opinión por cualquier razón y consecuentemente desistir del procedimiento o tratamiento previamente autorizado.\n\n',
      ),
      TextSpan(
          text:
              'Se deja expresa constancia de la confidencialidad que tendrán los datos suministrados y consig- nados dentro del presente documento, el cual se incorporară a la historia clínica y formará parte integrante de esta para todos los efectos legales.\n\n'),
      TextSpan(
          text:
              'Suscribimos el presente documento las personas que en el intervenimos:\n\n'),
      TextSpan(text: 'PACIENTE O REPRESENTANTE LEGAL\n\n'),
      TextSpan(text: '${widget.representacion[1]['nombres']}\n'),
      TextSpan(text: 'Dirección:\n'),
      TextSpan(text: '${widget.representacion[2]['direccion']}\n'),
      TextSpan(text: 'Teléfono:\n'),
      TextSpan(text: '${widget.representacion[3]['telefono']}\n'),
      TextSpan(text: 'EPS: ARS\n'),
      TextSpan(text: '${widget.representacion[4]['eps']}\n'),
      TextSpan(text: 'Empresa de salud prepagada\n'),
      TextSpan(text: '${widget.representacion[5]['prepagada']}\n'),
      TextSpan(text: '\n\n'),
      TextSpan(text: 'PROFESIONAL TRATANTE\n'),
      TextSpan(text: "${widget.configuracion[0]["profesional"]}\n"),
      TextSpan(text: 'Dirección:\n'),
      TextSpan(text: "${widget.configuracion[1]["direccion"]}\n"),
      TextSpan(text: 'Teléfono:\n'),
      TextSpan(text: "${widget.configuracion[2]["telefono"]}\n"),
      TextSpan(text: '\n\n'),
      TextSpan(text: 'TESTIGO\n\n'),
      TextSpan(text: 'Nombre:\n\n'),
      TextSpan(text: 'Dirección:\n\n'),
      TextSpan(text: 'Nombre:\n\n'),
      TextSpan(text: '\n\n'),
      TextSpan(text: 'PERSONA A CONTACTAR\n\n'),
      TextSpan(text: 'Firma:\n\n'),
      TextSpan(text: 'Teléfono:\n'),
    ];
    return textSpans;
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.representacion);
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: generaLineas(),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
