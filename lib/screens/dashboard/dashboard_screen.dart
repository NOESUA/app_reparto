// 📄 lib/screens/dashboard/dashboard_screen.dart

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final void Function(int) onTabChange;
  const DashboardScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        elevation: 0,
        title: const Text(
          'APP REPARTO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(
              context,
              icon: Icons.people,
              label: 'Clientes',
              index: 1,
              width: buttonWidth,
            ),
            const SizedBox(height: 20),
            _customButton(
              context,
              icon: Icons.payment,
              label: 'Pagos',
              index: 2,
              width: buttonWidth,
            ),
            const SizedBox(height: 20),
            _customButton(
              context,
              icon: Icons.map,
              label: 'Recorridos',
              index: 4,
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
    required int index,
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
        onPressed: () => onTabChange(index),
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
