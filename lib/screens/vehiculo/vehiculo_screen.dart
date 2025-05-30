import 'package:flutter/material.dart';

class VehiculoScreen extends StatelessWidget {
  const VehiculoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehículo')),
      body: const Center(child: Text('Pantalla del vehículo')),
    );
  }
}
