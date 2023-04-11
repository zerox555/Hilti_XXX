import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class cordlessTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getScreenHeight(context) * 0.03,
        ),
        Center(
            child: Text(
              "CORDLESS DRILL DRIVERS & SCREWDRIVERS",
              style: TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: hiltiRed,
              ),
              textAlign: TextAlign.center,
            )),
        SizedBox(
            width: getScreenWidth(context) * 0.9,
            child: Divider(
              color: hiltiRed,
              thickness: 2,
            )),
        SizedBox(height: getScreenHeight(context) * 0.02),
        Container(
            height: getScreenHeight(context) * 0.6,
            child: ListView(children: [
              Row(
                children: [
                  SizedBox(
                    width: getScreenWidth(context) * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/second');
                    },
                    child: singleCordless(
                        context,
                        "assets/images/cordless_drill/drill.jpg",
                        "Cordless Drill Drivers"),
                  ),
                  SizedBox(
                    width: getScreenWidth(context) * 0.02,
                  ),
                  singleCordless(
                      context,
                      "assets/images/cordless_drill/drywall.jpg",
                      "Cordless Drywall Screwdrivers"),
                ],
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getScreenWidth(context) * 0.1,
                  ),
                  singleCordless(
                      context,
                      "assets/images/cordless_drill/metal_construction.png",
                      "Cordless Metal Construction Screwdrivers")
                ],
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
            ]))
      ],
    );
  }
}
