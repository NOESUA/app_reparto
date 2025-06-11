import 'package:flutter/material.dart';
import 'package:app_soda/core/theme.dart';

/// Layout reutilizable con dos secciones: encabezado y contenido
class TwoSectionLayout extends StatelessWidget {
  /// Widget que se muestra en la sección superior (header)
  final Widget header;

  /// Widget que se muestra en la sección inferior (body)
  final Widget body;

  /// Altura del header en píxeles
  final double headerHeight;

  /// Radio de las esquinas redondeadas entre secciones
  final double borderRadius;

  const TwoSectionLayout({
    super.key,
    required this.header,
    required this.body,
    this.headerHeight = 200,
    this.borderRadius = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sección superior en color primario
        Container(
          height: headerHeight,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primario,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          child: SafeArea(child: header),
        ),

        // Sección inferior en color de fondo oscuro
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.fondoOscuro,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: body,
          ),
        ),
      ],
    );
  }
}
