import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _Formkey = GlobalKey<FormState>();

  final TextEditingController _Turmacontroller = TextEditingController();
  final TextEditingController _Turnocontroller = TextEditingController();
  final TextEditingController _Datacontroller = TextEditingController();
  final TextEditingController _Datafinalcontroller = TextEditingController();

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
            key: _Formkey,
            child: Column(children: [
              //TURMA
              TextFormField(
                controller: _Turmacontroller,
                decoration: const InputDecoration(labelText: "Turma: "),
              ),

              //TURNO
              TextFormField(
                controller: _Turnocontroller,
                decoration: const InputDecoration(
                  labelText: "Turno: ",
                ),
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

              //HORAS DA AULA DO DIA
              TextFormField()
              //CURSO
              //TextFormField()

              //BOTÃO DE CONFIRMAÇÃO
              // ElevatedButton(
              //   //BOTÃO DE CONFIRMAÇÃO
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       debugPrint("Musica cadastrada com sucesso!");
              //       Fluttertoast.showToast(
              //           msg: "Musica cadastrada com sucesso!",
              //           gravity: ToastGravity.CENTER_LEFT,
              //           backgroundColor: Colors.green);
              // }
              // },
              // child: const Text("Cadastrar"))
            ]),
          ),
        )),
      ),
    );
  }
}
