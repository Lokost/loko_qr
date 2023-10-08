import 'package:flutter/material.dart';
import 'package:loko_qr/data/util.dart';
import 'package:loko_qr/screens/home_screen.dart';
import 'package:loko_qr/screens/qr_scanner.dart';
import 'package:loko_qr/screens/result_screen.dart';
import 'package:loko_qr/screens/special_result.dart';
import 'package:loko_qr/screens/splash_screen.dart';
import 'package:loko_qr/themes.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  => MaterialApp(
    themeMode: ThemeMode.system,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    initialRoute: AppRoutes.splash,
    routes: {
      AppRoutes.splash: (ctx) => const SplashScreen(),
      AppRoutes.home: (ctx) => const HomeScreen(),
      AppRoutes.qrScanner: (ctx) => const QRScanner(),
      AppRoutes.result: (ctx) => const ResultScreen(),
      AppRoutes.specialResult: (ctx) => const SpecialResultScreen()
    }
  );
}
