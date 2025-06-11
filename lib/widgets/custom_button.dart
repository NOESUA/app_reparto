import 'package:flutter/material.dart';
import 'package:app_soda/core/theme.dart';

/// Botón personalizado con estilo consistente en toda la app
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(icon, size: 24, color: Colors.white)
          : const SizedBox.shrink(),
      label: Text(
        text,
        style: theme.textTheme.labelLarge?.copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        minimumSize: const Size.fromHeight(56),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        textStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        elevation: 2,
      ),
    );
  }
}
