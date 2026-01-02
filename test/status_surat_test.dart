import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_surat_desa/screens/status_surat.dart';
import 'package:e_surat_desa/models/submission.dart';

void main() {
  setUp(() {
    // reset repository sebelum tiap test
    SubmissionRepository.instance.clearAll();
  });

  testWidgets('Menampilkan pesan kosong jika belum ada pengajuan surat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: StatusSuratPage()));

    expect(find.text('Belum ada pengajuan'), findsOneWidget);
    expect(find.text('Ajukan Surat'), findsOneWidget);
  });

  testWidgets('Menampilkan list surat jika data tersedia', (
    WidgetTester tester,
  ) async {
    // arrange
    SubmissionRepository.instance.add(
      Submission(
        id: '1',
        jenis: 'Surat Keterangan Domisili',
        nik: '1234567890',
        nama: 'Budi',
        alamat: 'Cilacap',
        status: 'Menunggu',
        createdAt: DateTime(2024, 1, 10),
      ),
    );

    // act
    await tester.pumpWidget(const MaterialApp(home: StatusSuratPage()));
    await tester.pump();

    // assert
    expect(find.text('Surat Keterangan Domisili'), findsOneWidget);
    expect(find.text('Menunggu'), findsOneWidget);
    expect(find.textContaining('Diajukan pada:'), findsOneWidget);
  });

  testWidgets('Tombol Riwayat Surat selalu tampil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: StatusSuratPage()));

    expect(find.text('Riwayat Surat'), findsOneWidget);
  });
}
