// lib/halaman/halaman_utama.dart

import 'package:flutter/material.dart';
import '../data/vehicle_data.dart';
import 'halaman_detail.dart';
import 'halaman_login.dart';

// ini class buat halaman utama, isinya katalog mobil setelah user login.
class HalamanUtama extends StatelessWidget {
  final String username;

  const HalamanUtama({super.key, required this.username});

  // fungsi `_logout` ini buat ngembaliin user ke halaman login lagi.
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HalamanLogin()),
    );
  }

  // fungsi `build` ini yang nampilin semua tampilan di halaman utama.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Katalog Mobil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // bagian ini buat nampilin tulisan 'selamat datang, (username)'.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang, $username!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            // widget ini buat nampilin semua daftar mobilnya pake format grid.
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final Vehicle vehicle = vehicleList[index];
                // inkwell ini bikin card mobilnya jadi bisa di-klik buat ke detail.
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDetail(vehicle: vehicle),
                      ),
                    );
                  },
                  // card ini jadi kayak bingkainya buat tiap mobil, biar ada bayangan sama sudutnya.
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // bagian ini khusus buat nampilin gambar mobilnya dari link pertama di `imageUrls`.
                        Expanded(
                          child: vehicle.imageUrls.isNotEmpty
                              ? Image.network(
                                  vehicle.imageUrls[0],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                        // nah ini buat nampilin nama sama harga mobilnya di bawah gambar.
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                vehicle.price,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}