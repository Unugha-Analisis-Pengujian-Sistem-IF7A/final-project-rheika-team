// lib/screens/kelola_surat_masuk.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class KelolaSuratMasukPage extends StatefulWidget {
  const KelolaSuratMasukPage({super.key});

  @override
  State<KelolaSuratMasukPage> createState() => _KelolaSuratMasukPageState();
}

class _KelolaSuratMasukPageState extends State<KelolaSuratMasukPage> {
  final List<Map<String, String>> _items = [
    {
      'id': '1',
      'nama': 'Bebe',
      'jenis': 'Surat Domisili',
      'tanggal': '05 Oktober 2025',
      'status': 'Menunggu',
    },
    {
      'id': '2',
      'nama': 'Aditya',
      'jenis': 'Surat Keterangan Usaha',
      'tanggal': '03 Oktober 2025',
      'status': 'Diproses',
    },
    {
      'id': '3',
      'nama': 'Joko',
      'jenis': 'Surat Kematian',
      'tanggal': '05 Oktober 2025',
      'status': 'Ditolak',
    },
  ];

  int _bottomIndex = 1;

  void _onTapBottom(int idx) {
    if (idx == _bottomIndex) return;
    setState(() => _bottomIndex = idx);
    if (idx == 0) Navigator.pushReplacementNamed(context, '/dashboard_admin');
    if (idx == 1)
      Navigator.pushReplacementNamed(context, '/kelola_surat_masuk');
    if (idx == 2)
      Navigator.pushReplacementNamed(context, '/dashboard_admin'); // profile
  }

  void _updateStatus(int idx, String newStatus) {
    setState(() {
      _items[idx]['status'] = newStatus;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status "${_items[idx]['nama']}" → $newStatus')),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Selesai':
        return Colors.green;
      case 'Diproses':
        return Colors.blue;
      case 'Ditolak':
        return Colors.red;
      case 'Menunggu':
      default:
        return Colors.orange;
    }
  }

  Widget _actionButton({
    required String label,
    required VoidCallback onPressed,
    required Color bg,
    required Color fg,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: bg,
        foregroundColor: fg,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildCard(int idx) {
    final item = _items[idx];
    final status = item['status'] ?? 'Menunggu';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama : ${item['nama']}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            'Jenis Surat : ${item['jenis']}',
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            'Tanggal : ${item['tanggal']}',
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // status pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _statusColor(status).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: _statusColor(status),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              _actionButton(
                label: 'Proses',
                bg: const Color(0xFFD7EEFF),
                fg: const Color(0xFF2B7BD9),
                onPressed: () => _updateStatus(idx, 'Diproses'),
              ),
              const SizedBox(width: 8),
              _actionButton(
                label: 'Selesai',
                bg: const Color(0xFFE3F7E6),
                fg: const Color(0xFF2E8C46),
                onPressed: () => _updateStatus(idx, 'Selesai'),
              ),
              const SizedBox(width: 8),
              _actionButton(
                label: 'Tolak',
                bg: const Color(0xFFFFE6E6),
                fg: const Color(0xFFCB3A3A),
                onPressed: () => _updateStatus(idx, 'Ditolak'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header area
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.only(top: 28),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Expanded(
                        child: Text(
                          'Kelola Surat Masuk',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
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

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (ctx, i) => _buildCard(i),
                ),
              ),
            ),
          ),
        ],
      ),

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
}
