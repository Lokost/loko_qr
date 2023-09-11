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
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  _gohome() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Future.delayed(const Duration(seconds: 2));
    _showHome();
  }

  @override
  Widget build(BuildContext context) {
    _gohome();
    return Scaffold(
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
            const SizedBox(
              height: 20,
            ),
            Text("Loko QR", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30),),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Criado por ${AppInfo.creator}"),
              Text("Versão ${AppInfo.version}")
            ]
          ),
        )
      ),
    );
  }
}
