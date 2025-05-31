// archivo: card_cliente.dart

import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  final Map<String, dynamic> cliente;
  final VoidCallback? onEditar;

  const CardCliente({super.key, required this.cliente, this.onEditar});

  @override
  Widget build(BuildContext context) {
    final bool activo = cliente['activo'] ?? false;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: activo ? Colors.green : Colors.grey,
          child: Text(
            cliente['nombre'][0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          cliente['nombre'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('# ${cliente['telefono']}'),
            Text(cliente['dia'] ?? ''),
            const SizedBox(height: 4),
            Text(
              activo ? 'ACTIVO' : 'INACTIVO',
              style: TextStyle(
                color: activo ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 'editar' && onEditar != null) {
              onEditar!();
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(value: 'editar', child: Text('Editar')),
            const PopupMenuItem(value: 'eliminar', child: Text('Eliminar')),
          ],
        ),
      ),
    );
  }
}
