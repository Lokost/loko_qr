import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? result = ModalRoute.of(context)?.settings.arguments as String?;

    bool isURL = result!.toLowerCase().startsWith("https://") ||
        result.toLowerCase().startsWith("http://");

    openSite() {
      final url = Uri.parse(result);
      launchUrl(url, mode: LaunchMode.externalApplication);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Resultado"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result.toString()),
            const SizedBox(height: 10),
            if (isURL)
              ElevatedButton.icon(
                icon: const Icon(Icons.web),
                label: const Text("Abrir URL"),
                onPressed: () => openSite(),
              ),
          ],
        )));
  }
}
