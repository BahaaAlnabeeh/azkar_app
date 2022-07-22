import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  FaqsScreen({Key? key, this.message = 'No Message'}) : super(key: key);

  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
