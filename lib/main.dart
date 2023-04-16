import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/pages/LoadingPage.dart';
import 'package:hilti_xxx/pages/chatbotPage.dart';

void main() {
  runApp(const HiltiComp());
}

class HiltiComp extends StatelessWidget {
  const HiltiComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: chatbotPage(),
    );
  }
}
