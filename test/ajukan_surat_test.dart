import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/ajukan_surat.dart';

void main() {
  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
      routes: {
        '/riwayat_surat':
            (_) => const Scaffold(
              body: Center(child: Text('HALAMAN RIWAYAT SURAT')),
            ),
      },
    );
  }

  testWidgets('Menampilkan halaman Ajukan Surat', (tester) async {
    await tester.pumpWidget(makeTestableWidget(const AjukanSuratPage()));

    expect(find.text('Ajukan Surat'), findsOneWidget);
    expect(find.text('Jenis Surat'), findsOneWidget);
    expect(find.text('Kirim Pengajuan'), findsOneWidget);
  });

  testWidgets('Validasi gagal jika form kosong', (tester) async {
    await tester.pumpWidget(makeTestableWidget(const AjukanSuratPage()));

    await tester.tap(find.text('Kirim Pengajuan'));
    await tester.pump(); // tampilkan snackbar

    expect(find.text('Pilih jenis surat dulu'), findsOneWidget);
  });

  testWidgets('Submit berhasil menampilkan dialog sukses', (tester) async {
    await tester.pumpWidget(makeTestableWidget(const AjukanSuratPage()));

    // Buka pilihan jenis surat
    await tester.tap(find.text('Pilih jenis surat'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Surat Keterangan Domisili'));
    await tester.pumpAndSettle();

    // Isi form
    await tester.enterText(find.byType(TextField).at(0), '3301234567890001');
    await tester.enterText(find.byType(TextField).at(1), 'Budi Santoso');
    await tester.enterText(find.byType(TextField).at(2), 'Desa Sukamaju');

    // Submit
    await tester.tap(find.text('Kirim Pengajuan'));
    await tester.pumpAndSettle();

    // Dialog sukses
    expect(find.text('Pengajuan Terkirim'), findsOneWidget);
  });

  testWidgets('Klik OK mengarah ke halaman riwayat', (tester) async {
    await tester.pumpWidget(makeTestableWidget(const AjukanSuratPage()));

    // Pilih jenis surat
    await tester.tap(find.text('Pilih jenis surat'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Surat Keterangan Domisili'));
    await tester.pumpAndSettle();

    // Isi form
    await tester.enterText(find.byType(TextField).at(0), '3301234567890001');
    await tester.enterText(find.byType(TextField).at(1), 'Budi Santoso');
    await tester.enterText(find.byType(TextField).at(2), 'Desa Sukamaju');

    await tester.tap(find.text('Kirim Pengajuan'));
    await tester.pumpAndSettle();

    // Klik OK
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.text('HALAMAN RIWAYAT SURAT'), findsOneWidget);
  });
}
