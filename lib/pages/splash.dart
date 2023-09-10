import 'package:flutter/material.dart';
import 'package:loko_qr/util/data.dart';
import 'package:svg_flutter/svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loko_qr/firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _showHome() {
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  _goHome() async {
    await Future.delayed(const Duration(seconds: 2));
    _showHome();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                height: 170,
                width: 170,
              ),
              const Text("Loko QR"),
            ],
          ),
        ),
      );
}
