import 'package:flutter/material.dart';

const Color hiltiRed = Color(0xFFD50026);
const Color hiltiWhite = Colors.white;

double getScreenWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}

double getScreenHeight(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight;
}

Image hiltiLogo(BuildContext context, double width) {
  Image hiltiLogo = Image.asset(
    "assets/images/hilti_logo.png",
    width: getScreenWidth(context) * width,
  );
  return hiltiLogo;
}

var banner = [
  "assets/images/banner1.png",
  "assets/images/banner2.png",
  "assets/images/banner3.png",
  "assets/images/banner4.png",
];
