import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'package:hilti_xxx/utils/constant.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // load for 2 seconds before going to home page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hiltiRed,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hiltiLogo(context, 0.6),
            SizedBox(height: getScreenHeight(context) * 0.005),
            Text("We Build a Better Future",
                style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: getScreenHeight(context) * 0.025,
                    fontWeight: FontWeight.bold,
                    color: hiltiWhite)),
            SizedBox(height: getScreenHeight(context) * 0.05),
            SizedBox(
                height: getScreenHeight(context) * 0.04,
                width: getScreenWidth(context) * 0.075,
                child: const CircularProgressIndicator(
                  strokeWidth: 3.0,
                  color: hiltiWhite,
                )),
          ],
        )));
  }
}
