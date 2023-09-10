import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loko_qr/components/common_result.dart';
import 'package:loko_qr/components/special_result.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref();
  List<String> _codes = [];
  String _content = "";
  String title = "Resultado";
  Map<String, dynamic> data = {};
  late String result;

  bool get _iscode => _codes.contains(result);

  _getTitle(resutl) async {
    if (_iscode) {
      setState(
        () {
          _ref
              .child(result)
              .get()
              .then((value) => data = value.value as Map<String, dynamic>);
          title = data["title"];
          _content = data["content"];
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _codes = data["codes"];
    result = data['result'];
    _getTitle(result);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _iscode
          ? SpecialResult(title: title, content: _content)
          : CommonResult(result: result),
    );
  }
}
