import 'package:flutter/material.dart';

class SpecialResult extends StatelessWidget {
  final String content, title;
  const SpecialResult({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Placeholder(), height: 170, width: 170,),
        Expanded(
          flex: 1,
          child: Text(title),
        ),
        Expanded(
          flex: 5,
          child: Text(content),
        ),
      ],
    );
  }
}
