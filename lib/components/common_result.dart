import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonResult extends StatefulWidget {
  final String result;
  const CommonResult({required this.result, super.key});

  @override
  State<CommonResult> createState() => _CommonResultState();
}

class _CommonResultState extends State<CommonResult> {
  bool get _isURL {
    if (widget.result.toLowerCase().startsWith("https://") ||
        widget.result.toLowerCase().startsWith("http://")) {
      return true;
    }
    return false;
  }

  _openSite() {
    final url = Uri.parse(widget.result);
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.result,
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
