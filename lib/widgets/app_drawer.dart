import 'package:flutter/material.dart';
import 'package:app_reparto/core/theme.dart';

/// Drawer lateral con las principales secciones de la app
class AppDrawer extends StatelessWidget {
  final Function(int) onDestinationSelected;
  final int selectedIndex;

  const AppDrawer({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

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
          _DrawerItem(
            label: '👤 Mi perfil',
            icon: Icons.person,
            index: 7,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '👥 Clientes',
            icon: Icons.people,
            index: 1,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '🛒 Registro de Productos',
            icon: Icons.inventory,
            index: 3,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '💳 Gestión de Pagos',
            icon: Icons.shopping_cart,
            index: 2,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '📈 Reportes',
            icon: Icons.bar_chart,
            index: 5,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '🗺️ Gestión de Rutas',
            icon: Icons.route,
            index: 4,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '🚗 Vehículo',
            icon: Icons.directions_car,
            index: 6,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          _DrawerItem(
            label: '⚙️ Configuración',
            icon: Icons.settings,
            index: 8,
            selectedIndex: selectedIndex,
            onTap: onDestinationSelected,
          ),
          const Divider(color: Colors.white24),
          _DrawerItem(
            label: '🚪 Cerrar sesión',
            icon: Icons.logout,
            index: -1,
            selectedIndex: selectedIndex,
            onTap: (index) {
              // TODO: Implementar cierre de sesión
            },
          ),
        ],
      ),
    );
  }
}

/// Widget privado para un item del Drawer
class _DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = index == selectedIndex;
    
    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.primario : null),
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isSelected ? AppColors.primario : null,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap(index);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      hoverColor: AppColors.primario.withAlpha(26),
      selected: isSelected,
    );
  }
}
