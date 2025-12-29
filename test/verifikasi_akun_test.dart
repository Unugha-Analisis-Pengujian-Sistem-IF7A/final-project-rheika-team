import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/verifikasi_akun.dart';

void main() {
  group('VerifikasiAkunPage Widget Test', () {
    testWidgets('Menampilkan judul dan daftar akun warga', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: VerifikasiAkunPage()));

      // Judul
      expect(find.text('Verifikasi Akun Warga'), findsOneWidget);

      // Nama warga
      expect(find.text('Bebe'), findsOneWidget);
      expect(find.text('Aditya'), findsOneWidget);
      expect(find.text('Joko'), findsOneWidget);

      // Status awal
      expect(find.text('Pending'), findsNWidgets(3));
    });

    testWidgets('Klik tombol Terima mengubah status menjadi Disetujui', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: VerifikasiAkunPage()));

      // klik tombol Terima pertama
      await tester.tap(find.text('Terima').first);
      await tester.pump(); // trigger setState

      expect(find.text('Disetujui'), findsOneWidget);
    });

    testWidgets('Klik tombol Tolak mengubah status menjadi Ditolak', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: VerifikasiAkunPage()));

      // klik tombol Tolak pertama
      await tester.tap(find.text('Tolak').first);
      await tester.pump();

      expect(find.text('Ditolak'), findsOneWidget);
    });

    testWidgets('BottomNavigationBar tampil', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: VerifikasiAkunPage()));

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
