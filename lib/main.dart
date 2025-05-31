import 'package:app_soda/screens/clientes/clientes_formulario_screen.dart';
import 'package:app_soda/screens/clientes/clientes_mapa_screen.dart';
import 'package:app_soda/screens/clientes/clientes_lista_screen.dart';

import 'package:flutter/material.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/recorridos/recorridos_screen.dart';
import 'screens/reportes/reportes_screen.dart';
import 'screens/vehiculo/vehiculo_screen.dart';
import 'screens/ventas/ventas_screen.dart';
import 'screens/productos/productos_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/perfil/perfil_screen.dart';
import 'screens/configuracion/configuracion_screen.dart';

// Agrega otras pantallas que uses, como login, perfil, etc.

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
      theme: ThemeData.dark(), // o usa tu tema de core/theme.dart
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/recorridos': (context) => const RecorridosScreen(),
        '/reportes': (context) => const ReportesScreen(),
        '/vehiculo': (context) => const VehiculoScreen(),
        '/ventas': (context) => const VentasScreen(),
        '/clientes': (context) => const ClientesListaScreen(),

        '/perfil': (context) => const PerfilScreen(),
        '/productos': (context) => const ProductosScreen(),
        '/config': (context) => const ConfiguracionScreen(),
        '/logout': (context) => const LoginScreen(),

        '/clientes_formulario': (context) => const ClientesFormularioScreen(),
        '/clientes_mapa': (context) => const ClientesMapaScreen(),
        '/clientes_lista': (context) => const ClientesListaScreen(),
      },
    );
  }
}
