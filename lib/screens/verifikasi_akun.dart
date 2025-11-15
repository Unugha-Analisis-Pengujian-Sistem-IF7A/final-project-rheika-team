// lib/screens/verifikasi_akun.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class VerifikasiAkunPage extends StatefulWidget {
  const VerifikasiAkunPage({super.key});

  @override
  State<VerifikasiAkunPage> createState() => _VerifikasiAkunPageState();
}

class _VerifikasiAkunPageState extends State<VerifikasiAkunPage> {
  final List<Map<String, String>> items = [
    {
      'nama': 'Bebe',
      'nik': '1234567890',
      'email': 'bebe@email.com',
      'status': 'Pending',
    },
    {
      'nama': 'Aditya',
      'nik': '0987654321',
      'email': 'aditya@email.com',
      'status': 'Pending',
    },
    {
      'nama': 'Joko',
      'nik': '1122334455',
      'email': 'joko@email.com',
      'status': 'Pending',
    },
  ];

  void _setStatus(int idx, String newStatus) {
    setState(() {
      items[idx]['status'] = newStatus;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status ${items[idx]['nama']} diubah: $newStatus'),
      ),
    );
  }

  int _bottomIndex = 0;

  void _onTapBottom(int idx) {
    if (idx == _bottomIndex) return;
    setState(() => _bottomIndex = idx);
    // contoh navigasi dari bottom nav
    if (idx == 0) Navigator.pushReplacementNamed(context, '/dashboard_admin');
    if (idx == 1) Navigator.pushReplacementNamed(context, '/verifikasi_akun');
    if (idx == 2)
      Navigator.pushReplacementNamed(
        context,
        '/dashboard_admin',
      ); // atau profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // kita tidak gunakan appBar default — bikin header sendiri supaya mirip Figma
      body: Column(
        children: [
          // header area (biru)
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.only(top: 28),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // back row
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Expanded(
                        child: Text(
                          'Verifikasi Akun Warga',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // spacer supaya judul center
                    ],
                  ),
                  // ungu gradient bar (sedikit tinggi)
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.gradientTop, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // konten putih melengkung
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (ctx, i) {
                    final it = items[i];
                    return _buildCard(
                      i,
                      it['nama']!,
                      it['nik']!,
                      it['email']!,
                      it['status']!,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      // bottom navigation bar mirip figma
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: _onTapBottom,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Surat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    int idx,
    String nama,
    String nik,
    String email,
    String status,
  ) {
    Color statusColor;
    if (status == 'Disetujui' || status == 'Selesai')
      statusColor = Colors.green;
    else if (status == 'Ditolak')
      statusColor = Colors.red;
    else
      statusColor = Colors.orange;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            'NIK : $nik',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          Text(
            'Email : $email',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Status : ',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
              const Spacer(),
              // tombol Terima & Tolak (pill pastel)
              TextButton(
                onPressed: () => _setStatus(idx, 'Disetujui'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Terima',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => _setStatus(idx, 'Ditolak'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Tolak', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
