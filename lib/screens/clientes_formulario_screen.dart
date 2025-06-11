import 'package:flutter/material.dart';

class ClientesFormularioScreen extends StatefulWidget {
  final Map<String, dynamic>? cliente;

  const ClientesFormularioScreen({super.key, this.cliente});

  @override
  State<ClientesFormularioScreen> createState() =>
      _ClientesFormularioScreenState();
}

class _ClientesFormularioScreenState extends State<ClientesFormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _telefonoController;
  late TextEditingController _referenciaController;
  String _diaSeleccionado = 'Lunes';
  bool _activo = true;

  final List<String> _dias = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo',
  ];

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(
      text: widget.cliente?['nombre'] ?? '',
    );
    _apellidoController = TextEditingController(
      text: widget.cliente?['apellido'] ?? '',
    );
    _telefonoController = TextEditingController(
      text: widget.cliente?['telefono'] ?? '',
    );
    _referenciaController = TextEditingController(
      text: widget.cliente?['referencia'] ?? '',
    );
    _diaSeleccionado = widget.cliente?['dia'] ?? 'Lunes';
    _activo = widget.cliente?['activo'] ?? true;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _telefonoController.dispose();
    _referenciaController.dispose();
    super.dispose();
  }

  void _guardarCliente() {
    if (_formKey.currentState!.validate()) {
      final cliente = {
        'nombre': _nombreController.text,
        'apellido': _apellidoController.text,
        'telefono': _telefonoController.text,
        'referencia': _referenciaController.text,
        'dia': _diaSeleccionado,
        'activo': _activo,
      };
      Navigator.pop(context, cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        title: Text(
          widget.cliente == null ? 'Nuevo Cliente' : 'Editar Cliente',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _referenciaController,
                decoration: const InputDecoration(
                  labelText: 'Referencia',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _diaSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Día de entrega',
                  border: OutlineInputBorder(),
                ),
                items: _dias.map((String dia) {
                  return DropdownMenuItem<String>(value: dia, child: Text(dia));
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _diaSeleccionado = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Cliente Activo'),
                value: _activo,
                onChanged: (bool value) {
                  setState(() {
                    _activo = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _guardarCliente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF224466),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
