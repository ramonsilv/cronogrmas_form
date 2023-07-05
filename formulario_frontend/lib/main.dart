import 'package:flutter/material.dart';
import 'package:formulario_frontend/pagina.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronogramas',
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.red
          ),
      debugShowCheckedModeBanner: false,
      home: const Pagina(),
    );
  }
}