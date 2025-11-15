// lib/screens/riwayat_surat.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/submission.dart';

class RiwayatSuratPage extends StatefulWidget {
  const RiwayatSuratPage({super.key});

  @override
  State<RiwayatSuratPage> createState() => _RiwayatSuratPageState();
}

class _RiwayatSuratPageState extends State<RiwayatSuratPage> {
  List<Submission> items = [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() {
    items = SubmissionRepository.instance.getAll();
    setState(() {});
  }

  Widget statusPill(String status) {
    Color bg;
    Color text;
    if (status == 'Selesai') {
      bg = const Color(0xFFE8F5E9);
      text = const Color(0xFF2E7D32);
    } else if (status == 'Menunggu') {
      bg = const Color(0xFFFFF3E0);
      text = const Color(0xFFF57C00);
    } else if (status == 'Ditolak') {
      bg = const Color(0xFFFFEBEE);
      text = const Color(0xFFC62828);
    } else {
      bg = Colors.grey.shade200;
      text = Colors.black87;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: text,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _bigCard(Submission s) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.jenis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Diajukan pada: ${s.createdAt.day.toString().padLeft(2, '0')} ${_monthName(s.createdAt.month)} ${s.createdAt.year}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          // optional additional instruction text (mirip Figma)
          Text(
            s.status == 'Selesai'
                ? 'Dapat diambil di Balai Desa mulai tanggal ${s.createdAt.add(const Duration(days: 1)).day.toString().padLeft(2, '0')} ${_monthName(s.createdAt.add(const Duration(days: 1)).month)} ${s.createdAt.year}.'
                : (s.status == 'Ditolak'
                    ? 'Dibatalkan atau persyaratan tidak lengkap.'
                    : ''),
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Align(alignment: Alignment.centerRight, child: statusPill(s.status)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Surat'),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              list.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Belum ada riwayat',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed:
                              () =>
                                  Navigator.pushNamed(context, '/ajukan_surat'),
                          child: const Text('Ajukan Surat'),
                        ),
                      ],
                    ),
                  )
                  : ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (ctx, i) => _bigCard(list[i]),
                  ),
        ),
      ),
    );
  }

  String _monthName(int m) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return months[m - 1];
  }
}
