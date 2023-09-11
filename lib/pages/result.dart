import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loko_qr/components/common_result.dart';
import 'package:loko_qr/components/special_result.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref();
  List<String> _codes = [];
  String _title = "Resultado";
  late String result;
  late Color background;

  @override
  void initState() {
    super.initState();
  }

  // Variables for the special code
  String _content = "";
  late Map<dynamic, dynamic> _data;
  bool _iscode = false;
  bool readed = false;

  bool get checkCode => _codes.contains(result);

  _getContent(result) async {
    await _ref.child(result).once().then((value) {
      _data = value.snapshot.value as Map<dynamic, dynamic>;
      _content = _data['content'];
    });
    if (!readed) {
      setState(() {
        _title = _data["title"].toString();
        background = Colors.purple;
        _iscode = true;
      });
      readed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _codes = data["codes"];
    background = Theme.of(context).colorScheme.background;
    result = data["result"];
    if (checkCode) {
      _getContent(result);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: Container(
        decoration: _iscode
            ? const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                    Colors.blue,
                    Colors.purple,
                  ]))
            : BoxDecoration(color: background),
        child: _iscode
            ? SpecialResult(title: _title, content: _content)
            : CommonResult(result: result),
      ),
    );
  }
}
