import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class cordlessOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getScreenHeight(context) * 0.03,
        ),
        Center(
            child: Text(
          "CORDLESS TOOLS",
          style: TextStyle(
              fontFamily: "Helvetica",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: hiltiRed),
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
                      Navigator.pushNamed(context, '/second');
                    },
                    child: singleCordless(
                        context,
                        "assets/images/cordless_tools/drill_driver.jpg",
                        "Cordless Drill Drivers & Screwdrivers"),
                  ),
                  SizedBox(
                    width: getScreenWidth(context) * 0.02,
                  ),
                  singleCordless(
                      context,
                      "assets/images/cordless_tools/wrench.png",
                      "Cordless Impact Drivers & Wrenches"),
                ],
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              cordlessItems(
                  context,
                  "assets/images/cordless_tools/rotary_hammer.png",
                  "assets/images/cordless_tools/max_rotary_hammer.png",
                  "Cordless SDS Plus Rotary Hammers",
                  "Cordless SDS Max Rotary Hammers"),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              cordlessItems(
                  context,
                  "assets/images/cordless_tools/saws.jpg",
                  "assets/images/cordless_tools/grinders.png",
                  "Cordless Saws",
                  "Cordless Grinders"),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              cordlessItems(
                  context,
                  "assets/images/cordless_tools/fastening.png",
                  "assets/images/cordless_tools/measuring.png",
                  "Cordless Fastening Tools",
                  "Cordless Measuring Tools"),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              cordlessItems(
                  context,
                  "assets/images/cordless_tools/dispensers.png",
                  "assets/images/cordless_tools/dust.png",
                  "Cordless Dispensers",
                  "Cordless Vacuum & Dust Management"),
              SizedBox(
                height: getScreenHeight(context) * 0.01,
              ),
              cordlessItems(
                  context,
                  "assets/images/cordless_tools/lights.png",
                  "assets/images/cordless_tools/batteries.png",
                  "Cordless Jobsite Lights & Radios",
                  "Cordless Tools Batteries & Chargers"),
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
                      "assets/images/cordless_tools/accessories.png",
                      "Accessories for Cordless Tools")
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
