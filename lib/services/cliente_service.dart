// 📄 lib/services/cliente_service.dart

class ClienteService {
  static Future<List<Map<String, dynamic>>> obtenerClientes() async {
    // Simula una llamada a BD o API
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        {
          'nombre': 'Pedro Páramo',
          'telefono': '0990000000',
          'activo': true,
          'diaReparto': 'Jueves',
        },
      ];
    });
  }

  static Future<void> guardarCliente(Map<String, dynamic> cliente) async {
    // Guardar cliente en SQLite o enviar a API
  }

  static Future<void> eliminarCliente(String id) async {
    // Eliminar cliente por id
  }
}
