import 'package:flutter/material.dart';
import 'package:loko_qr/data/util.dart';
import 'package:svg_flutter/svg.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/logo.svg",
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                      height: 170,
                      width: 170,
                    ),
                    const SizedBox(height: 30),
                    const Text("Loko QR"),
                  ],
                ),
              ),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Criado por ${AppInfo.creator}"),
                      Text("Versão: ${AppInfo.version}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
