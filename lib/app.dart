import 'package:flutter/material.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/clientes/clientes_screen.dart';
import 'screens/ventas/ventas_screen.dart';
import 'screens/productos/productos_screen.dart';
import 'screens/recorridos/recorridos_screen.dart';
import 'screens/reportes/reportes_screen.dart';
import 'screens/vehiculo/vehiculo_screen.dart';
import 'screens/perfil/perfil_screen.dart';
import 'screens/configuracion/configuracion_screen.dart';
import 'widgets/app_drawer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(onTabChange: _onItemTapped),
      const ClientesScreen(),
      const VentasScreen(),
      const ProductosScreen(),
      const RecorridosScreen(),
      const ReportesScreen(),
      const VehiculoScreen(),
      const PerfilScreen(),
      const ConfiguracionScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Reparto'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      drawer: AppDrawer(
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Clientes',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Ventas',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory),
            label: 'Productos',
          ),
          NavigationDestination(
            icon: Icon(Icons.route),
            label: 'Recorridos',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Reportes',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_car),
            label: 'Vehículo',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
