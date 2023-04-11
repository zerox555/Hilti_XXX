import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/pages/cordlessFour.dart';

import '../utils/constant.dart';

class cordlessThree extends StatefulWidget {
  const cordlessThree({Key? key}) : super(key: key);

  @override
  State<cordlessThree> createState() => _cordlessThreeState();
}

class _cordlessThreeState extends State<cordlessThree> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _searchText = "";

  int _pageIndex = 0;

  void _onTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Column pageStuff(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => cordlessFour()));
          },
          child: driverItem(
              context,
              "assets/images/drill_drivers/sf_4.jpg",
              "RM1,100.00",
              "SF 4-A22 Cordless Drill Driver",
              "Compact-class cordless 22V drill driver with brushless motor for when you need higher performance during light-duty tasks or in hard-to-reach places"),
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.01,
        ),
        driverItem(
            context,
            "assets/images/drill_drivers/sf_6h.jpg",
            "RM2,120.00",
            "SF 6H-A22 (02) Cordless Hammer Drill Driver",
            "Power-class cordless 22V hammer drill driver with Active Torque Control and electronic clutch for universal use on wood, metal, masonry and other materials"),
      ],
    );
  }

  Column bodyThreeContent() {
    return buildTitle(context, "CORDLESS DRILL DRIVERS", pageStuff(context));
  }

  @override
  Widget build(BuildContext context) {
    return cordlessBody(context, _scaffoldKey, _searchText, _pageIndex, _onTap, true,
        bodyThreeContent());
    ;
  }
}
