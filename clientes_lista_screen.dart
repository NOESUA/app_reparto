// archivo: clientes_lista_screen.dart

import 'package:flutter/material.dart';
import 'package:app_soda/widgets/card_cliente.dart';
import 'package:app_soda/screens/clientes/clientes_formulario_screen.dart';

class ClientesListaScreen extends StatefulWidget {
  const ClientesListaScreen({super.key});

  @override
  State<ClientesListaScreen> createState() => _ClientesListaScreenState();
}

class _ClientesListaScreenState extends State<ClientesListaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _clientes = [
    {
      'nombre': 'JUAN TOALA',
      'apellido': 'TOALA',
      'telefono': '0980032989',
      'referencia': 'Cerca del parque',
      'ubicacion': null,
      'dia': 'Lunes',
      'activo': false,
    },
    {
      'nombre': 'DARWIN CALLE',
      'apellido': 'CALLE',
      'telefono': '0980330001',
      'referencia': 'Esquina de la tienda',
      'ubicacion': null,
      'dia': 'Viernes',
      'activo': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _abrirFormulario({Map<String, dynamic>? cliente}) async {
    final nuevoCliente = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClientesFormularioScreen(cliente: cliente),
      ),
    );

    if (nuevoCliente != null) {
      setState(() {
        if (cliente != null) {
          // editar
          final index = _clientes.indexOf(cliente);
          _clientes[index] = nuevoCliente;
        } else {
          // nuevo
          _clientes.add(nuevoCliente);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF224466),
        elevation: 0,
        title: const Text(
          'Clientes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          TextButton.icon(
            onPressed: () => _abrirFormulario(),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Nuevo', style: TextStyle(color: Colors.white)),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          tabs: const [
            Tab(text: 'Todos'),
            Tab(text: 'Activos'),
            Tab(text: 'Inactivos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListaClientes(_clientes),
          _buildListaClientes(_clientes.where((c) => c['activo']).toList()),
          _buildListaClientes(_clientes.where((c) => !c['activo']).toList()),
        ],
      ),
    );
  }

  Widget _buildListaClientes(List<Map<String, dynamic>> clientes) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return CardCliente(
          cliente: cliente,
          onEditar: () => _abrirFormulario(cliente: cliente),
        );
      },
    );
  }
}
