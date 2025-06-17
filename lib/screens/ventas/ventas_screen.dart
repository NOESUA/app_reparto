import 'package:flutter/material.dart';
import 'package:app_reparto/screens/ventas/metodo_pago_screen.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  String? clienteSeleccionado;
  double deudaCliente = 0;

  // Lista simulada de productos
  final List<Map<String, dynamic>> productos = [
    {'nombre': 'Soda 2L', 'precio': 1000.0, 'cantidad': 0},
    {'nombre': 'Agua 5L', 'precio': 1800.0, 'cantidad': 0},
    {'nombre': 'Soda 600ml', 'precio': 700.0, 'cantidad': 0},
  ];

  final List<String> clientes = ['Juan Pérez', 'Ana Torres', 'Carlos López'];

  double calcularTotal() {
    return productos.fold(
      0,
      (total, item) => total + item['precio'] * item['cantidad'],
    );
  }

  void _aumentarCantidad(int index) {
    setState(() {
      productos[index]['cantidad']++;
    });
  }

  void _disminuirCantidad(int index) {
    setState(() {
      if (productos[index]['cantidad'] > 0) {
        productos[index]['cantidad']--;
      }
    });
  }

  void _continuarConPago() {
    final totalVenta = calcularTotal();
    if (clienteSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Selecciona un cliente',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    if (totalVenta == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Agrega al menos un producto',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MetodoPagoScreen(
          totalVenta: totalVenta,
          cliente: clienteSeleccionado!,
          deuda: deudaCliente,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = calcularTotal();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        elevation: 0,
        title: const Text(
          'Ventas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Seleccionar cliente',
                border: OutlineInputBorder(),
              ),
              value: clienteSeleccionado,
              items: clientes.map((cliente) {
                return DropdownMenuItem(value: cliente, child: Text(cliente));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  clienteSeleccionado = value;
                  // Simulamos deuda (en real lo traerías desde una DB/API)
                  deudaCliente = clienteSeleccionado == 'Juan Pérez' ? 5000 : 0;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Productos:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return ListTile(
                    title: Text(
                      producto['nombre'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      '\$${producto['precio'].toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => _disminuirCantidad(index),
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          '${producto['cantidad']}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _aumentarCantidad(index),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _continuarConPago,
                icon: const Icon(Icons.payment),
                label: const Text('Continuar con el pago'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
