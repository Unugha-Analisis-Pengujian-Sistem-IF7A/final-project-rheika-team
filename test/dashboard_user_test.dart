import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/dashboard_user.dart';

void main() {
  testWidgets('DashboardUserPage menampilkan menu utama', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardUserPage()));

    // ASSERT UI
    expect(find.text('Hallo Pengguna'), findsOneWidget);
    expect(find.text('Ajukan Surat'), findsOneWidget);
    expect(find.text('Status Surat'), findsOneWidget);
    expect(find.text('Riwayat Surat'), findsOneWidget);

    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Surat'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
  });

  testWidgets('Tombol Ajukan Surat menavigasi ke halaman Ajukan Surat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const DashboardUserPage(),
          '/ajukan_surat':
              (context) => const Scaffold(
                body: Center(child: Text('AJUKAN SURAT PAGE')),
              ),
        },
      ),
    );

    await tester.tap(find.text('Ajukan Surat'));
    await tester.pumpAndSettle();

    expect(find.text('AJUKAN SURAT PAGE'), findsOneWidget);
  });

  testWidgets('Tombol Status Surat menavigasi ke halaman Status Surat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const DashboardUserPage(),
          '/status_surat':
              (context) => const Scaffold(
                body: Center(child: Text('STATUS SURAT PAGE')),
              ),
        },
      ),
    );

    await tester.tap(find.text('Status Surat'));
    await tester.pumpAndSettle();

    expect(find.text('STATUS SURAT PAGE'), findsOneWidget);
  });

  testWidgets('Tombol Riwayat Surat menavigasi ke halaman Riwayat Surat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const DashboardUserPage(),
          '/riwayat_surat':
              (context) => const Scaffold(
                body: Center(child: Text('RIWAYAT SURAT PAGE')),
              ),
        },
      ),
    );

    await tester.tap(find.text('Riwayat Surat'));
    await tester.pumpAndSettle();

    expect(find.text('RIWAYAT SURAT PAGE'), findsOneWidget);
  });

  testWidgets('BottomNavigationBar tab Surat membuka halaman Status Surat', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const DashboardUserPage(),
          '/status_surat':
              (context) => const Scaffold(
                body: Center(child: Text('STATUS SURAT PAGE')),
              ),
        },
      ),
    );

    await tester.tap(find.text('Surat'));
    await tester.pumpAndSettle();

    expect(find.text('STATUS SURAT PAGE'), findsOneWidget);
  });

  testWidgets('BottomNavigationBar tab Profil membuka halaman Profil User', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const DashboardUserPage(),
          '/profile_user':
              (context) =>
                  const Scaffold(body: Center(child: Text('PROFIL USER PAGE'))),
        },
      ),
    );

    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();

    expect(find.text('PROFIL USER PAGE'), findsOneWidget);
  });
}
