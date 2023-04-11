import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/pages/cordlessThree.dart';

import '../utils/constant.dart';

class cordlessTwo extends StatefulWidget {
  @override
  State<cordlessTwo> createState() => _cordlessTwoState();
}

class _cordlessTwoState extends State<cordlessTwo> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cordlessThree()));
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
        ]));
  }

  Column bodyTwoContent() {
    return buildTitle(
        context, "CORDLESS DRILL DRIVERS & SCREWDRIVERS", pageStuff(context));
  }

  @override
  Widget build(BuildContext context) {
    return cordlessBody(context, _scaffoldKey, _searchText, _pageIndex, _onTap, true,
        bodyTwoContent());
  }
}
