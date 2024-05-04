import 'package:consentimiento_informado/api.dart';
import 'package:consentimiento_informado/generar_consentimiento.dart';
import 'package:consentimiento_informado/paciente_model.dart';
import 'package:flutter/material.dart';

class BuscarPacientes extends StatefulWidget {
  const BuscarPacientes({super.key});

  @override
  State<BuscarPacientes> createState() => _BuscarPacientesState();
}

class _BuscarPacientesState extends State<BuscarPacientes> {
  List<Paciente> pacientes = [];
  bool buscando = false;
  final TextEditingController criterioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Buscar Pacientes'),
      ),
      body: ListView.builder(
        itemCount: pacientes.length + 1,
        itemBuilder: (context, index) {
          int indexx = index - 1;
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 0.77 * MediaQuery.of(context).size.width,
                          child: TextField(
                            onChanged: (value) {
                              if (value == '') pacientes = [];
                              setState(() {});
                            },
                            controller: criterioController,
                            decoration: const InputDecoration(
                              labelText: 'identificación del paciente',
                              hintText: 'Identificación',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.17 * MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                CircleBorder(
                                    eccentricity: BorderSide.strokeAlignCenter),
                              ),
                            ),
                            onPressed: () async {
                              pacientes = [];
                              setState(() {});
                              if (criterioController.text.length < 3) return;
                              setState(() {
                                buscando = !buscando;
                              });
                              pacientes =
                                  await getPacientes(criterioController.text);
                              setState(() {
                                buscando = !buscando;
                              });
                            },
                            child: const Icon(Icons.find_in_page),
                          ),
                        )
                      ],
                    ),
                  ),
                  !buscando
                      ? const SizedBox()
                      : const Center(
                          child: SizedBox(
                            width: 45,
                            height: 45,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            );
          } else {
            String nombres = pacientes[indexx].nombres!;
            String identificacion = pacientes[indexx].identificacion!;
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 1),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.brown,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenerarConsentimiento(
                            paciente: pacientes[indexx],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_right,
                      size: 40,
                      color: Colors.green,
                    ),
                  ),
                  tileColor: Colors.amber.shade50,
                  title: Text(nombres),
                  subtitle: Text(identificacion),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
