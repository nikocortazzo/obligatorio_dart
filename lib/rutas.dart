import 'package:flutter/material.dart';
import 'package:obligatorio_dart/paginas/pagina_inicio.dart';

class Rutas {
  
  static Map<String, Widget Function(BuildContext)> rutas = {
    '/': (context) => const PaginaInicio(),
  };

  static String rutaInicial = '/';

  static Route<dynamic>? generadorRutas(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const PaginaInicio(),
      settings: settings,
    );
  }


}