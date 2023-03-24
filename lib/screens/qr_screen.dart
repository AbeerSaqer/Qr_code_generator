import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  TextEditingController _editingController =
      TextEditingController(text: '');
  String? data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Generator Qr Code',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: 'Enter data here'),
              controller: _editingController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data = _editingController.text;
                });
              },
              child: Text('Generate QR'),
            ),
            SizedBox(height: 50),
            Center(
                child: QrImage(
              data: '$data',
              version: QrVersions.auto,
              size: 200.0,
            ))
          ],
        ),
      ),
    );
  }
}
