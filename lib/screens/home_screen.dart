import 'package:flutter/material.dart';
import 'package:loko_qr/data/util.dart';
import 'package:loko_qr/layouts/home_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      buttonAction: () =>
          Navigator.of(context).pushNamed(AppRoutes.qrScanner),
    );
  }
}
