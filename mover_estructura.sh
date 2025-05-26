#!/bin/bash
# mover_estructura.sh

# Crear subcarpetas en screens si no existen
mkdir -p lib/screens/login
mkdir -p lib/screens/home
mkdir -p lib/screens/clientes
mkdir -p lib/screens/recorridos
mkdir -p lib/screens/ventas
mkdir -p lib/screens/vehiculo
mkdir -p lib/screens/reportes

# Mover archivos de pantallas a sus subcarpetas (ajusta los nombres si es necesario)
[ -f lib/clientes_screen.dart ] && mv lib/clientes_screen.dart lib/screens/clientes/clientes_screen.dart
[ -f lib/cliente_form.dart ] && mv lib/cliente_form.dart lib/screens/clientes/cliente_form.dart
[ -f lib/home_screen.dart ] && mv lib/home_screen.dart lib/screens/home/home_screen.dart
[ -f lib/login_screen.dart ] && mv lib/login_screen.dart lib/screens/login/login_screen.dart
[ -f lib/recorridos_screen.dart ] && mv lib/recorridos_screen.dart lib/screens/recorridos/recorridos_screen.dart
[ -f lib/ventas_screen.dart ] && mv lib/ventas_screen.dart lib/screens/ventas/ventas_screen.dart
[ -f lib/vehiculo_screen.dart ] && mv lib/vehiculo_screen.dart lib/screens/vehiculo/vehiculo_screen.dart
[ -f lib/reportes_screen.dart ] && mv lib/reportes_screen.dart lib/screens/reportes/reportes_screen.dart

echo "Estructura revisada y archivos movidos. Ahora revisa y actualiza los imports en tu código."