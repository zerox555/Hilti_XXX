import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/pages/cordlessTwo.dart';

import '../utils/constant.dart';

class cordlessOne extends StatefulWidget {
  @override
  State<cordlessOne> createState() => _cordlessOneState();
}

class _cordlessOneState extends State<cordlessOne> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _searchText = "";
  int _pageIndex = 0;

  void _onTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
  
  Container pageStuff(BuildContext context) {
    return Container(
        height: getScreenHeight(context) * 0.6,
        child: ListView(children: [
          Row(
            children: [
              SizedBox(
                width: getScreenWidth(context) * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cordlessTwo()));
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
        ]));

  }

  Column bodyOneContent() {
    return buildTitle(context, "CORDLESS TOOLS", pageStuff(context));
  }

  @override
  Widget build(BuildContext context) {
    return cordlessBody(context, _scaffoldKey, _searchText, _pageIndex, _onTap, true,
        bodyOneContent());
  }
}
