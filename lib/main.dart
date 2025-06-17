import 'package:flutter/material.dart';

// Core Theme
import 'package:app_reparto/core/theme.dart';

// Screens
import 'package:app_reparto/screens/dashboard/dashboard_screen.dart';
import 'package:app_reparto/screens/recorridos/recorridos_screen.dart';
import 'package:app_reparto/screens/reportes/reportes_screen.dart';
import 'package:app_reparto/screens/vehiculo/vehiculo_screen.dart';
import 'package:app_reparto/screens/ventas/ventas_screen.dart';
import 'package:app_reparto/screens/clientes/clientes_formulario_screen.dart';
import 'package:app_reparto/screens/clientes/clientes_mapa_screen.dart';
import 'package:app_reparto/screens/productos/productos_screen.dart';
import 'package:app_reparto/screens/login/login_screen.dart';
import 'package:app_reparto/screens/perfil/perfil_screen.dart';
import 'package:app_reparto/screens/configuracion/configuracion_screen.dart';
import 'package:app_reparto/app.dart';

void main() {
  runApp(const AppReparto());
}

class AppReparto extends StatelessWidget {
  const AppReparto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Reparto',
      theme: appTheme,
      home: const App(),
    );
  }
}

/// Definición central de rutas para mantener consistencia en toda la app
abstract class Routes {
  static const String dashboard = '/';
  static const String recorridos = '/recorridos';
  static const String reportes = '/reportes';
  static const String vehiculo = '/vehiculo';
  static const String ventas = '/ventas';
  static const String clientesFormulario = '/clientes_formulario';
  static const String clientesMapa = '/clientes_mapa';
  static const String productos = '/productos';
  static const String perfil = '/perfil';
  static const String configuracion = '/config';
  static const String logout = '/logout';
}
