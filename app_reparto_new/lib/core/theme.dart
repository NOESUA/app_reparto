import 'package:flutter/material.dart';

/// Colores de la aplicación centralizados para un modo oscuro coherente
class AppColors {
  static const Color primario = Color(0xFF224466); // Azul mate
  static const Color fondoOscuro = Color(0xFF23272A); // Negro suave
  static const Color fondoBottomNav = Color(0xFF1E1E1E); // Fondo barra inferior
  static const Color acento = primario;
  static const Color error = Colors.redAccent;
}

/// Tema global de la app combinando colores, tipografía y estilos de componentes
final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primario,
    secondary: AppColors.acento,
    error: AppColors.error,
    surface: AppColors.fondoOscuro,
  ),

  scaffoldBackgroundColor: AppColors.fondoOscuro,

  // Tipografía global optimizada para legibilidad
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      letterSpacing: 0.5,
      height: 1.5,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      letterSpacing: 0.25,
      height: 1.5,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      letterSpacing: 0.4,
      height: 1.5,
      color: Colors.white70,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
  ),

  // Tema para bottom navigation bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.fondoBottomNav,
    selectedItemColor: AppColors.primario,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),

  // Estilo para inputs optimizado para uso en campo
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.fondoOscuro,
    labelStyle: const TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(color: Colors.white54, fontSize: 16),
    prefixIconColor: AppColors.primario,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: Colors.white24),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: Colors.white24),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      borderSide: BorderSide(color: AppColors.primario, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
  ),

  // Botones elevados optimizados para uso táctil
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primario,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
      minimumSize: const Size.fromHeight(56),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
      elevation: 2,
    ),
  ),

  // AppBar optimizada
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primario,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white, size: 28),
  ),

  // Card theme corregido para la versión de Flutter que espera CardThemeData
  cardTheme: const CardTheme(
    color: AppColors.primario,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  ),

  // Icon theme global
  iconTheme: const IconThemeData(color: Colors.white, size: 24),
); 