import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/kelola_surat_masuk.dart';

void main() {
  group('KelolaSuratMasukPage Widget Test', () {
    testWidgets('Menampilkan judul dan daftar surat masuk', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: KelolaSuratMasukPage()));

      // Judul
      expect(find.text('Kelola Surat Masuk'), findsOneWidget);

      // Data warga
      expect(find.textContaining('Bebe'), findsOneWidget);
      expect(find.textContaining('Aditya'), findsOneWidget);
      expect(find.textContaining('Joko'), findsOneWidget);

      // Jenis surat
      expect(find.textContaining('Surat Domisili'), findsOneWidget);
      expect(find.textContaining('Surat Keterangan Usaha'), findsOneWidget);
      expect(find.textContaining('Surat Kematian'), findsOneWidget);
    });

    testWidgets('Klik tombol Proses mengubah status menjadi Diproses', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: KelolaSuratMasukPage()));

      await tester.tap(find.text('Proses').first);
      await tester.pump();

      expect(find.text('Diproses'), findsWidgets);
    });

    testWidgets('Klik tombol Selesai mengubah status menjadi Selesai', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: KelolaSuratMasukPage()));

      await tester.tap(find.text('Selesai').first);
      await tester.pump();

      expect(find.text('Selesai'), findsWidgets);
    });

    testWidgets('Klik tombol Tolak mengubah status menjadi Ditolak', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: KelolaSuratMasukPage()));

      await tester.tap(find.text('Tolak').first);
      await tester.pump();

      expect(find.text('Ditolak'), findsWidgets);
    });

    testWidgets('BottomNavigationBar tampil', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: KelolaSuratMasukPage()));

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
