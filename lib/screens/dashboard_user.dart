// lib/screens/dashboard_user.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class DashboardUserPage extends StatefulWidget {
  const DashboardUserPage({super.key});

  @override
  State<DashboardUserPage> createState() => _DashboardUserPageState();
}

class _DashboardUserPageState extends State<DashboardUserPage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    // panggil navigator dulu (lebih aman), lalu setState untuk highlight
    if (index == 1) {
      // buka halaman status/riwayat
      debugPrint('Tapped Surat tab');
      Navigator.pushNamed(context, '/status_surat');
    } else if (index == 2) {
      debugPrint('Tapped Profil tab');
      Navigator.pushNamed(context, '/profile_user');
    } else {
      debugPrint('Tapped Beranda tab');
      // tetap di beranda / tidak perlu Navigator
    }

    // update currentIndex supaya icon terlihat aktif (opsional)
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hallo Pengguna",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),

              _menuButton(context, "Ajukan Surat"),
              const SizedBox(height: 18),

              _menuButton(context, "Status Surat"),
              const SizedBox(height: 18),

              _menuButton(context, "Riwayat Surat"),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped, // panggil fungsi onTabTapped
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

  Widget _menuButton(BuildContext context, String text) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (text == "Ajukan Surat") {
            Navigator.pushNamed(context, '/ajukan_surat');
          } else if (text == "Status Surat") {
            Navigator.pushNamed(context, '/status_surat');
          } else if (text == "Riwayat Surat") {
            Navigator.pushNamed(context, '/riwayat_surat');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.textDark,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
