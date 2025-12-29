import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_surat_desa/screens/splash_screen.dart';

void main() {
  testWidgets(
    'SplashScreen menampilkan judul dan berpindah halaman setelah 3 detik',
    (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => const SplashScreen(),
            '/choose_role':
                (context) => const Scaffold(body: Text('Choose Role Screen')),
          },
          initialRoute: '/',
        ),
      );

      // ASSERT UI MUNCUL
      expect(find.text('e-Surat Desa'), findsOneWidget);
      expect(
        find.text('Solusi digital pengajuan surat desa Anda'),
        findsOneWidget,
      );

      // ACT: maju waktu 3 detik
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // ASSERT: pindah halaman
      expect(find.text('Choose Role Screen'), findsOneWidget);
    },
  );
}
