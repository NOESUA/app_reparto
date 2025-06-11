import 'package:flutter/material.dart';
import 'clientes_mapa_screen.dart';

class ClientesFormularioScreen extends StatefulWidget {
  final Map<String, dynamic>? cliente;

  const ClientesFormularioScreen({super.key, this.cliente});

  @override
  State<ClientesFormularioScreen> createState() =>
      _ClientesFormularioScreenState();
}

class _ClientesFormularioScreenState extends State<ClientesFormularioScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombresController;
  late TextEditingController _apellidosController;
  late TextEditingController _telefonoController;
  late TextEditingController _referenciaController;

  String? _ubicacion;
  String _dia = 'Lunes';

  @override
  void initState() {
    super.initState();

    final cliente = widget.cliente;

    _nombresController = TextEditingController(text: cliente?['nombre']);
    _apellidosController = TextEditingController(text: cliente?['apellido']);
    _telefonoController = TextEditingController(text: cliente?['telefono']);
    _referenciaController = TextEditingController(text: cliente?['referencia']);
    _ubicacion = cliente?['ubicacion'];
    _dia = cliente?['dia'] ?? 'Lunes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        elevation: 0,
        title: const Text(
          'Formulario de cliente',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _dia,
                items: const [
                  DropdownMenuItem(value: 'Lunes', child: Text('Lunes')),
                  DropdownMenuItem(value: 'Martes', child: Text('Martes')),
                  DropdownMenuItem(
                    value: 'Miércoles',
                    child: Text('Miércoles'),
                  ),
                  DropdownMenuItem(value: 'Jueves', child: Text('Jueves')),
                  DropdownMenuItem(value: 'Viernes', child: Text('Viernes')),
                  DropdownMenuItem(value: 'Sábado', child: Text('Sábado')),
                  DropdownMenuItem(value: 'Domingo', child: Text('Domingo')),
                ],
                onChanged: (value) => setState(() => _dia = value!),
                decoration: const InputDecoration(
                  labelText: 'Día de reparto',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nombresController,
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _referenciaController,
                decoration: const InputDecoration(
                  labelText: 'Referencia del domicilio',
                  prefixIcon: Icon(Icons.home),
                ),
              ),
              const SizedBox(height: 16),

              /// BOTÓN DE UBICACIÓN
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClientesMapaScreen(),
                    ),
                  );
                  setState(() => _ubicacion = result);
                },
                icon: const Icon(Icons.location_pin),
                label: const Text('Seleccionar ubicación'),
              ),
              const SizedBox(height: 8),
              Text(
                _ubicacion ?? 'Sin seleccionar ubicación',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(height: 16),

              /// BOTÓN DE REGISTRO
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nuevoCliente = {
                      'nombre': _nombresController.text,
                      'apellido': _apellidosController.text,
                      'telefono': _telefonoController.text,
                      'referencia': _referenciaController.text,
                      'ubicacion': _ubicacion,
                      'dia': _dia,
                      'activo': true,
                    };
                    Navigator.pop(context, nuevoCliente);
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
