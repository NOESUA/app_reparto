import 'package:flutter/material.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Clientes')),
      body: const Center(child: Text('Pantalla de clientes')),
    );
  }
}
