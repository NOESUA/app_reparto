// lib/widgets/app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PABLO VICINO',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text('1723776280', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 8),
                Text(
                  '¡Bienvenido a la aplicación!',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // --- Menú principal ---
          _item(
            context,
            icon: Icons.person,
            label: 'Mi perfil',
            route: '/perfil',
          ),
          _item(
            context,
            icon: Icons.people,
            label: '📋 Gestión de Clientes',
            route: '/clientes',
          ),
          _item(
            context,
            icon: Icons.local_drink,
            label: '🛒 Registro de Productos',
            route: '/productos',
          ),
          _item(
            context,
            icon: Icons.payment,
            label: '💳 Gestión de Pagos',
            route: '/ventas',
          ),
          _item(
            context,
            icon: Icons.bar_chart,
            label: '📈 Reportes',
            route: '/reportes',
          ),
          _item(
            context,
            icon: Icons.map,
            label: '🗺️ Gestión de Rutas',
            route: '/recorridos',
          ),
          _item(
            context,
            icon: Icons.settings,
            label: '⚙️ Configuración',
            route: '/configuracion',
          ),
          const Divider(),
          _item(
            context,
            icon: Icons.logout,
            label: 'Cerrar sesión',
            route: '/', // ← normalmente vuelve al login
          ),
        ],
      ),
    );
  }

  // Helper privado
  ListTile _item(
    BuildContext ctx, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(ctx); // cerrar drawer
        Navigator.pushNamed(ctx, route);
      },
    );
  }
}
// Este widget crea un menú lateral (drawer) con opciones de navegación
// y un encabezado con el nombre del usuario y un mensaje de bienvenida.