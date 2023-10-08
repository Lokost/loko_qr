import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomeLayout extends StatelessWidget {
  final Function() buttonAction;
  const HomeLayout({super.key, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loko QR"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/logo.svg",
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              height: 120,
              width: 120,
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: buttonAction,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.qr_code_scanner, size: 170, color: Colors.white),
                            Text(
                              "Escanear código",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
