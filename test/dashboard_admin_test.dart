import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/dashboard_admin.dart';

void main() {
  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
      routes: {
        '/surat_admin':
            (context) => const Scaffold(body: Text('Surat Admin Page')),
        '/profile_admin':
            (context) => const Scaffold(body: Text('Profile Admin Page')),
        '/verifikasi_akun':
            (context) => const Scaffold(body: Text('Verifikasi Akun Page')),
        '/kelola_surat_masuk':
            (context) => const Scaffold(body: Text('Kelola Surat Masuk Page')),
      },
    );
  }

  testWidgets('DashboardAdminPage menampilkan UI utama', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(const DashboardAdminPage()));

    // Header
    expect(find.text('Halo, Admin Desa'), findsOneWidget);

    // Statistik
    expect(find.text('Surat Masuk : 25'), findsOneWidget);
    expect(find.text('Akun Menunggu Verifikasi : 8'), findsOneWidget);
    expect(find.text('Warga Terdaftar : 78'), findsOneWidget);

    // Tombol
    expect(find.text('Verifikasi Akun Warga'), findsOneWidget);
    expect(find.text('Kelola Surat Masuk'), findsOneWidget);
  });

  testWidgets('Navigasi tombol Verifikasi Akun Warga', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(const DashboardAdminPage()));

    await tester.tap(find.text('Verifikasi Akun Warga'));
    await tester.pumpAndSettle();

    expect(find.text('Verifikasi Akun Page'), findsOneWidget);
  });

  testWidgets('Navigasi tombol Kelola Surat Masuk', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(const DashboardAdminPage()));

    await tester.tap(find.text('Kelola Surat Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Kelola Surat Masuk Page'), findsOneWidget);
  });

  testWidgets('BottomNavigationBar navigasi ke Surat Admin', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(const DashboardAdminPage()));

    // Tap item ke-1 (Surat)
    await tester.tap(find.byIcon(Icons.description_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Surat Admin Page'), findsOneWidget);
  });

  testWidgets('BottomNavigationBar navigasi ke Profil Admin', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(const DashboardAdminPage()));

    // Tap item ke-2 (Profil)
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(find.text('Profile Admin Page'), findsOneWidget);
  });
}
