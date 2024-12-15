import 'package:flutter/material.dart';
import 'package:obligatorio_dart/rutas.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicacion Obligatorio',
      routes: Rutas.rutas,
      initialRoute: Rutas.rutaInicial,
      onGenerateRoute: Rutas.generadorRutas,
    );
  }
}
