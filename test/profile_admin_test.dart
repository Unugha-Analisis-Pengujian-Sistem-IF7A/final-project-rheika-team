import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/profile_admin.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(home: ProfileAdminPage());
  }

  group('Profile Admin Page Test', () {
    testWidgets('Menampilkan AppBar Profil dan data admin', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      // AppBar title (hindari double "Profil")
      expect(
        find.descendant(of: find.byType(AppBar), matching: find.text('Profil')),
        findsOneWidget,
      );

      // Data profil admin
      expect(find.text('Nama Lengkap'), findsOneWidget);
      expect(find.text('Admin'), findsOneWidget);

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('admin@desa.id'), findsOneWidget);
    });

    testWidgets('Menampilkan tombol Logout', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      expect(find.text('Logout'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('BottomNavigationBar tampil dengan 3 item', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      expect(find.text('Beranda'), findsOneWidget);
      expect(find.text('Surat'), findsOneWidget);
      expect(find.text('Profil'), findsWidgets);
      // findsWidgets karena AppBar + BottomNavigationBar
    });
  });
}
