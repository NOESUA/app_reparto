import 'package:flutter/material.dart';
import 'clientes_mapa_screen.dart';

class ClientesFormularioScreen extends StatefulWidget {
  const ClientesFormularioScreen({super.key});

  @override
  State<ClientesFormularioScreen> createState() =>
      _ClientesFormularioScreenState();
}

class _ClientesFormularioScreenState extends State<ClientesFormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _ubicacion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de cliente'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'Cédula', child: Text('Cédula')),
                  DropdownMenuItem(value: 'RUC', child: Text('RUC')),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Tipo de identificación',
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cédula',
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Referencia del domicilio',
                  prefixIcon: Icon(Icons.home),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClientesMapaScreen(),
                    ),
                  );
                  setState(() {
                    _ubicacion = result;
                  });
                },
                icon: const Icon(Icons.location_pin),
                label: const Text('Seleccionar ubicación'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
              Text(
                _ubicacion ?? 'Sin seleccionar ubicación',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar cliente
                  }
                },
                child: const Text('Registrar cliente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
