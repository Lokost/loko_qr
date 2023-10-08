import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loko_qr/components/popup.dart';
import 'package:loko_qr/data/util.dart';
import 'package:loko_qr/firebase_options.dart';
import 'package:loko_qr/layouts/splash_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    void goToPage() {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }

    startFirebase() async {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    }

    popup(String msg) {
      showDialog(
        barrierDismissible: false,
        useRootNavigator: true,
        context: context,
        builder: (ctx) => Dialog(
          child: LokoPopup(
            msg: msg,
            actions: [
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text("Atualizar"),
                onPressed: () {
                  final url = Uri.parse(
                      "https://github.com/Lokost/loko_qr/releases/latest");
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.access_time),
                label: const Text("Mais tarde"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ).then((_) async {
        await Future.delayed(const Duration(seconds: 2));
        goToPage();
      });
    }

    startAll() async {
      await startFirebase();
      final result = await LokoUtil.verifyVersion();
      if (!["updated", "error"].contains(result["case"]?.toString())) {
        popup(result["msg"].toString());
      } else {
        await Future.delayed(const Duration(seconds: 2));
        goToPage();
      }
    }

    startAll();
    return const SplashLayout();
  }
}
