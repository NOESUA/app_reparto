import 'package:flutter/material.dart';
import 'package:app_soda/core/theme.dart';
import 'package:app_soda/main.dart'; // Para acceso a Routes

/// Drawer lateral con las principales secciones de la app
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Encabezado con usuario y bienvenida
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primario),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PABLO VICINO', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text('1723776280', style: theme.textTheme.bodySmall),
                const SizedBox(height: 8),
                Text(
                  '¡Bienvenido a la aplicación!',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          // Items del menú
          _DrawerItem(label: '👤 Mi perfil', route: Routes.perfil),
          _DrawerItem(
            label: '📋 Gestión de Clientes',
            route: Routes.clientesLista,
          ),
          _DrawerItem(
            label: '🛒 Registro de Productos',
            route: Routes.productos,
          ),
          _DrawerItem(label: '💳 Gestión de Pagos', route: Routes.ventas),
          _DrawerItem(label: '📈 Reportes', route: Routes.reportes),
          _DrawerItem(label: '🗺️ Gestión de Rutas', route: Routes.recorridos),
          _DrawerItem(label: '⚙️ Configuración', route: Routes.configuracion),
          const Divider(color: Colors.white24),
          _DrawerItem(label: '🚪 Cerrar sesión', route: Routes.logout),
        ],
      ),
    );
  }
}

/// Widget privado para un item del Drawer
class _DrawerItem extends StatelessWidget {
  final String label;
  final String route;

  const _DrawerItem({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(label, style: theme.textTheme.bodyLarge),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      hoverColor: AppColors.primario.withAlpha(26),
    );
  }
}
