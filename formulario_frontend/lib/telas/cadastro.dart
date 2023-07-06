import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _Turmacontroller = TextEditingController();
  final TextEditingController _Datacontroller = TextEditingController();
  final TextEditingController _Datafinalcontroller = TextEditingController();
  final TextEditingController _Horasaulacontroller = TextEditingController();
  final TextEditingController _Cursocontroller = TextEditingController();
  String? _selectedCurso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario Turma"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [

              //TURMA
              TextFormField(
                controller: _Turmacontroller,
                decoration: const InputDecoration(
                  labelText: "Turma: ",
                  prefixIcon: Icon(Icons.add_to_queue_rounded),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
              ),

              //TURMA
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Turno: ",
                  prefixIcon: Icon(Icons.wb_sunny_outlined),
                ),
                value: _selectedCurso,
                onChanged: (String? value) {
                  setState(() {
                    _selectedCurso = value;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: "Matutino",
                    child: Text("Matutino"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Vespertino",
                    child: Text("Vespertino"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Noturno",
                    child: Text("Noturno"),
                  ),
                ],
                ),

              //DATA DE INICIO DO CURSO
              DateTimeField(
                controller: _Datacontroller,
                decoration: InputDecoration(
                  labelText: "Inicio do Curso: ",
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                format: DateFormat("dd/MM/yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return "Campo Obrigatorio";
                  }
                },
              ),

              //DATA FINAL DO CURSO
              DateTimeField(
                controller: _Datafinalcontroller,
                decoration: InputDecoration(
                  labelText: "Final do Curso: ",
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_month_sharp),
                ),
                format: DateFormat("dd/MM/yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return "Campo Obrigatorio";
                  }
                },
              ),

              //HORAS DA AULA DO DIA
              TextFormField(
                controller: _Horasaulacontroller,
                decoration: const InputDecoration(
                  labelText: "Horas da Aula: ",
                  prefixIcon: Icon(Icons.access_time_filled),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
              ),

              //CURSO
              TextFormField(
                controller: _Cursocontroller,
                decoration: const InputDecoration(
                  labelText: "Curso: ",
                  prefixIcon: Icon(Icons.assignment_ind_rounded)
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }
                },
              ),

              //BOTÃO DE CONFIRMAÇÃO
              ElevatedButton(
                //BOTÃO DE CONFIRMAÇÃO
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    debugPrint("Turma cadastrada com sucesso!");
                    Fluttertoast.showToast(
                        msg: "Turma cadastrada com sucesso!",
                        gravity: ToastGravity.CENTER_LEFT,
                        backgroundColor: Colors.lightBlueAccent);
                }
              },
              child: const Text("Cadastrar")),
            ]),
          ),
        )),
      ),
    );
  }
}
