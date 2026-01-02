import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/register_user.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(home: RegisterUserPage());
  }

  group('Register User Page Test', () {
    testWidgets('Menampilkan semua field dan tombol daftar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      // Judul
      expect(find.text('Daftar Akun Baru'), findsOneWidget);
      expect(find.text('Lengkapi Data Berikut'), findsOneWidget);

      // Field input
      expect(find.byType(TextFormField), findsNWidgets(5));
      expect(find.text('Nama Lengkap'), findsOneWidget);
      expect(find.text('NIK'), findsOneWidget);
      expect(find.text('Alamat'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);

      // Tombol daftar
      expect(find.text('Daftar'), findsOneWidget);
    });

    testWidgets('Validasi gagal jika field kosong', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      // Klik tombol daftar tanpa input
      await tester.tap(find.text('Daftar'));
      await tester.pump();

      // Pesan error
      expect(find.text('Field tidak boleh kosong'), findsWidgets);
    });

    testWidgets('Menampilkan dialog sukses jika form valid', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      // Isi semua field
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama Lengkap'),
        'Bebe',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'NIK'),
        '1234567890',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Alamat'),
        'Yogyakarta',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'bebe@email.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        'password123',
      );

      // Submit
      await tester.tap(find.text('Daftar'));
      await tester.pumpAndSettle();

      // Dialog sukses
      expect(find.text('Pendaftaran Berhasil'), findsOneWidget);
      expect(
        find.text('Akun Anda terdaftar dan menunggu verifikasi oleh admin.'),
        findsOneWidget,
      );
      expect(find.text('OK'), findsOneWidget);
    });
  });
}
