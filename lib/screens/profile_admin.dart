import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileAdminPage extends StatelessWidget {
  const ProfileAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoBox(label: 'Nama Lengkap', value: 'Admin'),
              const SizedBox(height: 12),
              _infoBox(label: 'Email', value: 'admin@desa.id'),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  // LOGOUT: SUDAH BENAR ke /choose_role
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/choose_role');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Navigasi ke Dashboard
            Navigator.pushReplacementNamed(context, '/dashboard_admin');
          } else if (index == 1) {
            // PERBAIKAN: Menggunakan rute yang benar sesuai main.dart
            Navigator.pushReplacementNamed(context, '/kelola_surat_masuk');
          } else if (index == 2) {
            // Halaman profil (tetap di sini)
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Surat',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _infoBox({required String label, required String value}) {
    // ... (metode _infoBox tidak diubah)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: const TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }
}
