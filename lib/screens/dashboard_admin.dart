// lib/screens/dashboard_admin.dart
import 'package:flutter/material.dart';
import '../theme.dart';

// Ubah menjadi StatefulWidget agar bisa mengelola state BottomNavigationBar
class DashboardAdminPage extends StatefulWidget {
  const DashboardAdminPage({super.key});

  @override
  State<DashboardAdminPage> createState() => _DashboardAdminPageState();
}

class _DashboardAdminPageState extends State<DashboardAdminPage> {
  // Indeks terpilih saat ini untuk BottomNavigationBar
  // 0: Home/Dashboard, 1: Surat, 2: Profil Admin
  int _selectedIndex = 0;

  // List of routes or functions for navigation items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Logika navigasi berdasarkan index
    switch (index) {
      case 0:
        // Jika index 0 (Home), tetap di halaman ini (DashboardAdminPage)
        // Tidak perlu navigasi, atau bisa ditambahkan logika untuk memastikan ini adalah root.
        break;
      case 1:
        // Index 1 (Surat/Description icon) - Contoh navigasi ke halaman surat
        // Karena di dashboard sudah ada tombol Kelola Surat Masuk,
        // mungkin ini dimaksudkan untuk navigasi ke halaman surat admin.
        // Asumsi rute: '/surat_admin'
        // Anda bisa mengganti ini jika rute yang dimaksud berbeda.
        Navigator.pushNamed(context, '/surat_admin');
        break;
      case 2:
        // Index 2 (Person icon) - Navigasi ke halaman Profil Admin
        Navigator.pushNamed(context, '/profile_admin');
        break;
    }
  }

  // Widget untuk Card Statistik (tetap sama)
  Widget _buildStatCard(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientTop, AppColors.gradientBottom],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Halo, Admin Desa',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Konten utama
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Statistik
                        _buildStatCard('Surat Masuk : 25', Icons.mail_outline),
                        const SizedBox(height: 16),
                        _buildStatCard(
                          'Akun Menunggu Verifikasi : 8',
                          Icons.access_time,
                        ),
                        const SizedBox(height: 16),
                        _buildStatCard(
                          'Warga Terdaftar : 78',
                          Icons.people_outline,
                        ),
                        const SizedBox(height: 30),

                        // Tombol navigasi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/verifikasi_akun',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Verifikasi Akun Warga',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/kelola_surat_masuk',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Kelola Surat Masuk',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar yang sudah diubah
      bottomNavigationBar: BottomNavigationBar(
        // Tambahkan fungsi onItemTapped untuk navigasi
        onTap: _onItemTapped,
        // Set currentIndex menggunakan state
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home', // Menambahkan label untuk kejelasan (optional)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Surat', // Menambahkan label untuk kejelasan (optional)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil', // Menambahkan label untuk kejelasan (optional)
          ),
        ],
      ),
    );
  }
}
