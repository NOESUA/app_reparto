import 'package:flutter/material.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  // Ejemplo de estructura de productos (esto será dinámico con base de datos luego)
  final List<Map<String, dynamic>> productos = [
    {'nombre': 'Bidón Agua 20L', 'precio': 1700.00, 'cantidad': 0},
    {'nombre': 'Dispenser de Mesa', 'precio': 2500.00, 'cantidad': 0},
    {'nombre': 'Bomba Eléctrica Recargable', 'precio': 3200.00, 'cantidad': 0},
  ];

  double get total => productos.fold(
    0,
    (sum, item) => sum + (item['cantidad'] * item['precio']),
  );

  void incrementar(int index) {
    setState(() {
      productos[index]['cantidad']++;
    });
  }

  void decrementar(int index) {
    setState(() {
      if (productos[index]['cantidad'] > 0) {
        productos[index]['cantidad']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ventas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            producto['nombre'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Precio: \$${producto['precio'].toStringAsFixed(2)}',
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => decrementar(index),
                                  ),
                                  Text(
                                    producto['cantidad'].toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => incrementar(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí conectar con métodos de pago
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ir a medios de pago')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Continuar a Pago',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
