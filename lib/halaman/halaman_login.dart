// lib/halaman/halaman_login.dart
// Username: Dzaky Wiratama
// Password: 124230024

import 'package:flutter/material.dart';
import 'halaman_utama.dart';

// ini class utama buat halaman login, sengaja pake stateful biar bisa ngelola inputan user.
class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  // ini variabel buat ngambil teks dari kolom username sama password.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // fungsi `_login` ini buat ngecek username sama passwordnya bener apa ngga pas tombol login ditekan.
  void _login() {
    const String username = 'Dzaky Wiratama';
    const String password = '124230024';

    if (_usernameController.text == username &&
        _passwordController.text == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HalamanUtama(username: _usernameController.text),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau Password salah!';
      });
    }
  }

  // fungsi `build` ini yang nampilin semua tampilan buat halaman login.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // bagian ini buat nampilin icon mobil sama tulisan selamat datang di atas.
              const Icon(Icons.directions_car, size: 80, color: Colors.blueAccent),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Masuk untuk melanjutkan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              // ini widget buat kolom input username.
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // yang ini buat kolom input password, `obscureText` biar isinya jadi bintang-bintang.
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // bagian ini cuma muncul kalo username atau passwordnya salah.
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
              // ini tombol loginnya, kalo ditekan bakal jalanin fungsi `_login`.
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}