// lib/main.dart

import 'package:flutter/material.dart';
import 'halaman/halaman_login.dart';

// Revisi: Import google_fonts dihapus

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Kendaraan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Revisi: Mengatur font family default untuk seluruh aplikasi.
        // Semua widget Text sekarang akan menggunakan Montserrat secara otomatis.
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HalamanLogin(),
    );
  }
}