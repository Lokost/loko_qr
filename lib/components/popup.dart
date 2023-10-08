import 'package:flutter/material.dart';

class LokoPopup extends StatelessWidget {
  final String msg;
  final String? title;
  final List<Widget>? actions;
  const LokoPopup({
    super.key,
    required this.msg,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: FittedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(msg),
                const SizedBox(height: 20),
                if (actions != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: actions!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
