import 'package:flutter/material.dart';

// Screens principales
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

// Tema centralizado
import 'package:app_soda/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Reparto',
      theme: appTheme, // Usa el tema desde core/theme.dart
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/recorridos': (context) => const RecorridosScreen(),
        '/reportes': (context) => const ReportesScreen(),
        '/vehiculo': (context) => const VehiculoScreen(),
        '/ventas': (context) => const VentasScreen(),
        '/clientes': (context) => const ClientesListaScreen(),
        '/clientes_formulario': (context) => const ClientesFormularioScreen(),
        '/clientes_mapa': (context) => const ClientesMapaScreen(),
        '/productos': (context) => const ProductosScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/config': (context) => const ConfiguracionScreen(),
        '/logout': (context) => const LoginScreen(),
      },
    );
  }
}
