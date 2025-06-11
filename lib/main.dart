import 'package:flutter/material.dart';

// Core Theme
import 'package:app_soda/core/theme.dart';

// Screens
import 'package:app_soda/screens/dashboard/dashboard_screen.dart';
import 'package:app_soda/screens/recorridos/recorridos_screen.dart';
import 'package:app_soda/screens/reportes/reportes_screen.dart';
import 'package:app_soda/screens/vehiculo/vehiculo_screen.dart';
import 'package:app_soda/screens/ventas/ventas_screen.dart';
import 'package:app_soda/screens/clientes/clientes_lista_screen.dart';
import 'package:app_soda/screens/clientes/clientes_formulario_screen.dart';
import 'package:app_soda/screens/clientes/clientes_mapa_screen.dart';
import 'package:app_soda/screens/productos/productos_screen.dart';
import 'package:app_soda/screens/login/login_screen.dart';
import 'package:app_soda/screens/perfil/perfil_screen.dart';
import 'package:app_soda/screens/configuracion/configuracion_screen.dart';

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
      initialRoute: Routes.dashboard,
      routes: {
        Routes.dashboard: (context) => const DashboardScreen(),
        Routes.recorridos: (context) => const RecorridosScreen(),
        Routes.reportes: (context) => const ReportesScreen(),
        Routes.vehiculo: (context) => const VehiculoScreen(),
        Routes.ventas: (context) => const VentasScreen(),
        Routes.clientesLista: (context) => const ClientesListaScreen(),
        Routes.clientesFormulario: (context) =>
            const ClientesFormularioScreen(),
        Routes.clientesMapa: (context) => const ClientesMapaScreen(),
        Routes.productos: (context) => const ProductosScreen(),
        Routes.perfil: (context) => const PerfilScreen(),
        Routes.configuracion: (context) => const ConfiguracionScreen(),
        Routes.logout: (context) => const LoginScreen(),
      },
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
  static const String clientesLista = '/clientes';
  static const String clientesFormulario = '/clientes_formulario';
  static const String clientesMapa = '/clientes_mapa';
  static const String productos = '/productos';
  static const String perfil = '/perfil';
  static const String configuracion = '/config';
  static const String logout = '/logout';
}
