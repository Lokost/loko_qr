import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loko_qr/data/util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final _ref = FirebaseDatabase.instance.ref();
  final List<String> _codes = [];
  late final StreamSubscription _codeGetter;
  QRViewController? controller;

  final GlobalKey qr = GlobalKey(debugLabel: "qr");

  _onQRCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scan) async {
      controller.dispose();
      bool iscode = _codes.contains(scan.code!);
      if (iscode) {
        print("Is Special");
        Navigator.of(context).pushReplacementNamed(AppRoutes.specialResult,
              arguments: await _ref.child(scan.code!).get().then((value) => value.value) as Map<dynamic, dynamic>);}
         else { Navigator.of(context)
              .pushReplacementNamed(AppRoutes.result, arguments: scan.code!);}});
    }

  _getCodes() {
    _codeGetter = _ref.onChildAdded.listen(
      (event) => _codes.add(event.snapshot.key.toString()),
    );
  }

  @override
  void initState() {
    _getCodes();
    super.initState();
  }

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
        centerTitle: true,
      ),
      body: QRView(
        key: qr,
        onQRViewCreated: _onQRCreated,
        overlay: QrScannerOverlayShape(
          overlayColor: Colors.black45,
          borderColor: Colors.red,
          borderRadius: 30,
          borderWidth: 4,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeGetter.cancel();
    controller!.dispose();
    super.dispose();
  }
}
