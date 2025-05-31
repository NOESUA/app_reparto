// 📄 lib/screens/dashboard/dashboard_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('APP REPARTO'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(
              context,
              icon: Icons.people,
              label: 'Clientes',
              route: '/clientes',
              width: buttonWidth,
            ),
            const SizedBox(height: 20),
            _customButton(
              context,
              icon: Icons.payment,
              label: 'Pagos',
              route: '/ventas',
              width: buttonWidth,
            ),
            const SizedBox(height: 20),
            _customButton(
              context,
              icon: Icons.map,
              label: 'Recorridos',
              route: '/recorridos',
              width: buttonWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
    required double width,
  }) {
    return SizedBox(
      width: width,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4B5D67),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16),
          elevation: 4,
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
