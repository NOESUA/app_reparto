import 'package:flutter/material.dart';

class ClientesMapaScreen extends StatelessWidget {
  const ClientesMapaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Esto es solo una maqueta por ahora
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar ubicación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Lat: -0.1807, Lng: -78.4678');
              },
              child: const Text('Confirmar ubicación'),
            ),
          ],
        ),
      ),
    );
  }
}
