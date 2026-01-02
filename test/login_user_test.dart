import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/login_user.dart';

void main() {
  group('Login User Page Test', () {
    testWidgets('Menampilkan form login', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginUserPage()));

      // ASSERT UI
      expect(find.text('e-Surat Desa'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Remember Me'), findsOneWidget);
      expect(find.text('Forgot Password'), findsOneWidget);
      expect(find.text('Daftar'), findsOneWidget);
    });

    testWidgets('Tombol Login menavigasi ke Dashboard User', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginUserPage(),
            '/dashboard_user':
                (context) => const Scaffold(
                  body: Center(
                    child: Text(
                      'DASHBOARD USER',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
          },
        ),
      );

      // Tap tombol login
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // ASSERT tujuan
      expect(find.text('DASHBOARD USER'), findsOneWidget);
    });

    testWidgets('Link Forgot Password menavigasi ke halaman Forgot Password', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginUserPage(),
            '/forgot_password':
                (context) => const Scaffold(
                  body: Center(child: Text('FORGOT PASSWORD PAGE')),
                ),
          },
        ),
      );

      await tester.tap(find.text('Forgot Password'));
      await tester.pumpAndSettle();

      expect(find.text('FORGOT PASSWORD PAGE'), findsOneWidget);
    });

    testWidgets('Link Daftar menavigasi ke halaman Register User', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginUserPage(),
            '/register_user':
                (context) => const Scaffold(
                  body: Center(child: Text('REGISTER USER PAGE')),
                ),
          },
        ),
      );

      await tester.tap(find.text('Daftar'));
      await tester.pumpAndSettle();

      expect(find.text('REGISTER USER PAGE'), findsOneWidget);
    });
  });
}
