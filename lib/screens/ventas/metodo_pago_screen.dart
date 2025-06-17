import 'package:flutter/material.dart';

// Lista global para almacenar los pagos realizados
List<Map<String, dynamic>> pagosRegistrados = [];

class MetodoPagoScreen extends StatefulWidget {
  final double totalVenta;
  final String cliente;
  final double deuda;

  const MetodoPagoScreen({
    super.key,
    required this.totalVenta,
    required this.cliente,
    required this.deuda,
  });

  @override
  State<MetodoPagoScreen> createState() => _MetodoPagoScreenState();
}

class _MetodoPagoScreenState extends State<MetodoPagoScreen> {
  final TextEditingController efectivoController = TextEditingController();
  final TextEditingController transferenciaController = TextEditingController();

  bool usarCredito = false;
  bool pagarDeuda = false;
  bool sumarVentaADueda = false;

  double get montoEfectivo => double.tryParse(efectivoController.text) ?? 0.0;
  double get montoTransferencia =>
      double.tryParse(transferenciaController.text) ?? 0.0;
  double get totalPagado => montoEfectivo + montoTransferencia;

  double get nuevaDeuda {
    double restanteParaDeuda = widget.deuda;

    // Total disponible para pagar deuda anterior
    double disponible = totalPagado;

    // Primero intentamos pagar la deuda anterior
    if (pagarDeuda) {
      if (disponible >= widget.deuda) {
        restanteParaDeuda = 0; // se paga toda la deuda
        disponible -= widget.deuda;
      } else {
        restanteParaDeuda -= disponible; // solo paga una parte
        disponible = 0;
      }
    }

    // Luego, si desea sumar la venta a la deuda
    double restoVenta = widget.totalVenta - disponible;
    if (!sumarVentaADueda) restoVenta = 0;

    return (restanteParaDeuda + restoVenta).clamp(0, double.infinity);
  }

  void _confirmarPago() {
    final metodos = <String, double>{};
    if (montoEfectivo > 0) metodos['Efectivo'] = montoEfectivo;
    if (montoTransferencia > 0) metodos['Transferencia'] = montoTransferencia;
    if (usarCredito && sumarVentaADueda) {
      final restante = widget.totalVenta - totalPagado;
      if (restante > 0) metodos['Crédito'] = restante;
    }

    if (!usarCredito && totalPagado < widget.totalVenta) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'El total pagado es insuficiente',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar pago'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cliente: ${widget.cliente}'),
            const SizedBox(height: 10),
            Text('Total Venta: \$${widget.totalVenta.toStringAsFixed(2)}'),
            Text('Total Pagado: \$${totalPagado.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            if (usarCredito) ...[
              Text('🧾 Detalle de deuda:'),
              if (pagarDeuda)
                Text(
                  widget.deuda == 0
                      ? 'No hay deuda anterior.'
                      : totalPagado >= widget.deuda
                      ? 'Se paga toda la deuda anterior.'
                      : 'Se paga parcialmente la deuda anterior: \$${(totalPagado.clamp(0, widget.deuda)).toStringAsFixed(2)}',
                ),
              if (sumarVentaADueda)
                Text('Se suma a la deuda parte de esta venta.'),
              Text('👉 Nueva Deuda Total: \$${nuevaDeuda.toStringAsFixed(2)}'),
            ],
            const SizedBox(height: 10),
            const Text('Métodos usados:'),
            ...metodos.entries.map(
              (e) => Text('${e.key}: \$${e.value.toStringAsFixed(2)}'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Guardar el pago en memoria
              pagosRegistrados.add({
                'cliente': widget.cliente,
                'totalVenta': widget.totalVenta,
                'pagado': totalPagado,
                'deudaAnterior': widget.deuda,
                'nuevaDeuda': nuevaDeuda,
                'metodos': metodos,
                'fecha': DateTime.now(),
              });

              Navigator.pop(context); // Cierra diálogo
              Navigator.pop(context); // Regresa a la pantalla anterior
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Pago registrado',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    efectivoController.dispose();
    transferenciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Método de Pago')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cliente: ${widget.cliente}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Deuda anterior: ${widget.deuda > 0 ? "-\$${widget.deuda.toStringAsFixed(2)}" : "\$0.00"}',
              style: TextStyle(
                fontSize: 16,
                color: widget.deuda > 0 ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total a pagar: \$${widget.totalVenta.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),
            const Text(
              'Métodos de pago:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: efectivoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Efectivo',
                prefixIcon: Icon(Icons.money),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: transferenciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Transferencia',
                prefixIcon: Icon(Icons.account_balance),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              value: usarCredito,
              title: const Text('¿Usar Crédito (Fiado)?'),
              onChanged: (value) {
                setState(() {
                  usarCredito = value;
                  if (!value) {
                    pagarDeuda = false;
                    sumarVentaADueda = false;
                  }
                });
              },
            ),
            if (usarCredito) ...[
              CheckboxListTile(
                value: pagarDeuda,
                onChanged: (value) =>
                    setState(() => pagarDeuda = value ?? false),
                title: const Text('Pagar deuda anterior'),
              ),
              CheckboxListTile(
                value: sumarVentaADueda,
                onChanged: (value) =>
                    setState(() => sumarVentaADueda = value ?? false),
                title: const Text('Sumar esta venta a la deuda'),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _confirmarPago,
                icon: const Icon(Icons.check),
                label: const Text('Confirmar Pago'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
