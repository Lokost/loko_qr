import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonResult extends StatelessWidget {
  final String result;
  const CommonResult({required this.result, super.key});

  bool get _isURL {
    if (result.toLowerCase().contains("https://") ||
        result.toLowerCase().contains("http://")) {
      return true;
    }
    return false;
  }

  _openSite() {
    final _url = Uri.parse(result);
    launchUrl(_url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          result,
          softWrap: true,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        if (_isURL)
          ElevatedButton.icon(
            onPressed: () => _openSite(),
            label: const Text("Abrir URL"),
            icon: const Icon(Icons.web),
          )
      ]),
    );
  }
}
