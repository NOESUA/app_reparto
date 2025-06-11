import 'package:flutter/material.dart';

/// Tarjeta de cliente con estado activo/inactivo y opciones de menú
class CardCliente extends StatelessWidget {
  final Map<String, dynamic> cliente;
  final VoidCallback onEditar;

  const CardCliente({super.key, required this.cliente, required this.onEditar});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          '${cliente['nombre']} ${cliente['apellido']}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Teléfono: ${cliente['telefono']}'),
            Text('Día: ${cliente['dia']}'),
            Text('Referencia: ${cliente['referencia']}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              cliente['activo'] ? Icons.check_circle : Icons.cancel,
              color: cliente['activo'] ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            IconButton(icon: const Icon(Icons.edit), onPressed: onEditar),
          ],
        ),
      ),
    );
  }
}
