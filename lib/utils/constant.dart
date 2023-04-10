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

Column itemCategories(BuildContext context, String image1, String image2,
    String item1, String item2) {
  return Column(children: [
    Container(
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 4.0),
        width: getScreenWidth(context) * 0.52,
        height: getScreenHeight(context) * 0.085,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: hiltiWhite,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image1,
              width: getScreenWidth(context) * 0.085,
            ),
            SizedBox(width: getScreenWidth(context) * 0.03),
            Expanded(child: Center(child: Text(item1)))
          ],
        )),
    SizedBox(height: getScreenHeight(context) * 0.005),
    Container(
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 4.0),
        width: getScreenWidth(context) * 0.52,
        height: getScreenHeight(context) * 0.085,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: hiltiWhite,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image2,
              width: getScreenWidth(context) * 0.085,
            ),
            SizedBox(width: getScreenWidth(context) * 0.03),
            Expanded(
                child: Center(
              child: Text(item2),
            ))
          ],
        )),
  ]);
}
