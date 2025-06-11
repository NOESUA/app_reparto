import 'package:flutter/material.dart';

class VehiculoScreen extends StatelessWidget {
  const VehiculoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        elevation: 0,
        title: const Text(
          'Vehículo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text('Pantalla del vehículo')),
    );
  }
}
