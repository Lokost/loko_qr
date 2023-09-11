import 'package:flutter/material.dart';
import 'package:loko_qr/pages/home.dart';
import 'package:loko_qr/pages/qr_scanner.dart';
import 'package:loko_qr/pages/result.dart';
import 'package:loko_qr/pages/splash.dart';
import 'package:loko_qr/util/data.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          surface: Colors.red,
          primary: Colors.white,
          secondary: Colors.purple,
        ),
      ),
      title: "Loko QR",
      initialRoute: AppRoutes.splash,
      routes:  {
        AppRoutes.splash: (ctx) => const SplashScreen(),
        AppRoutes.home: (ctx) => const HomeScreen(),
        AppRoutes.scanner: (ctx) => const QRScanner(),
        AppRoutes.result: (ctx) => const ResultScreen()
      }
    );
  }
}