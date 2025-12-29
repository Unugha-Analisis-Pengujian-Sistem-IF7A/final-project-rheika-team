import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/choose_role.dart';

void main() {
  testWidgets(
    'Tombol Login sebagai Pengguna menavigasi ke halaman Login User',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const ChooseRolePage(),
            '/login_user':
                (context) => const Scaffold(
                  body: Center(
                    child: Text(
                      'HALAMAN LOGIN USER',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
          },
        ),
      );

      // Pastikan halaman choose role tampil
      expect(find.text('Masuk ke e-Surat Desa'), findsOneWidget);

      // Tap tombol user
      await tester.tap(find.text('Login sebagai Pengguna'));
      await tester.pumpAndSettle();

      // Pastikan tulisan muncul (seperti splash)
      expect(find.text('HALAMAN LOGIN USER'), findsOneWidget);
    },
  );

  testWidgets('Tombol Login sebagai Admin menavigasi ke halaman Login Admin', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const ChooseRolePage(),
          '/admin_login':
              (context) => const Scaffold(
                body: Center(
                  child: Text(
                    'HALAMAN LOGIN ADMIN',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
        },
      ),
    );

    // Pastikan tombol admin ada
    expect(find.text('Login sebagai Admin'), findsOneWidget);

    // Tap tombol admin
    await tester.tap(find.text('Login sebagai Admin'));
    await tester.pumpAndSettle();

    // Pastikan tulisan muncul
    expect(find.text('HALAMAN LOGIN ADMIN'), findsOneWidget);
  });
}
