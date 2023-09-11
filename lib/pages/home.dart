import 'package:flutter/material.dart';
import 'package:loko_qr/util/data.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Loko QR"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/logo.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 120,
                    width: 120),
                Expanded(
                  child: Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.scanner),
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.qr_code_scanner, size: 170),
                              Text(
                                "Escanear código",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
