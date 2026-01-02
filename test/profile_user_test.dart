import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/profile_user.dart';

void main() {
  group('ProfileUserPage Widget Test', () {
    testWidgets('Menampilkan judul dan data profil', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileUserPage()));

      // ⚠️ "Profil" ada di AppBar + BottomNav
      expect(find.text('Profil'), findsNWidgets(2));

      // Label
      expect(find.text('Nama Lengkap'), findsOneWidget);
      expect(find.text('NIK'), findsOneWidget);
      expect(find.text('Alamat'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);

      // Value
      expect(find.text('Bebe'), findsOneWidget);
      expect(find.text('1234567890'), findsOneWidget);
      expect(find.text('Yogyakarta'), findsOneWidget);
      expect(find.text('bebe@email.com'), findsOneWidget);
    });

    testWidgets('Tombol Logout tampil', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileUserPage()));

      expect(find.text('Logout'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('BottomNavigationBar tampil', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileUserPage()));

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      expect(find.text('Beranda'), findsOneWidget);
      expect(find.text('Surat'), findsOneWidget);

      // ⚠️ Profil muncul 2x (AppBar + BottomNav)
      expect(find.text('Profil'), findsNWidgets(2));
    });
  });
}
