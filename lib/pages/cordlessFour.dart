import 'package:flutter/material.dart';

import '../utils/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class cordlessFour extends StatefulWidget {
  const cordlessFour({Key? key}) : super(key: key);

  @override
  State<cordlessFour> createState() => _cordlessFourState();
}

class _cordlessFourState extends State<cordlessFour> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _searchText = "";

  int _pageIndex = 0;

  void _onTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Stack bodyFourContent() {
    return Stack(children: [
      ListView(
        children: [
          SizedBox(
            height: getScreenHeight(context) * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/drill_drivers/sf_4.jpg",
                width: getScreenWidth(context) * 0.5,
              ),
              Image.asset(
                "assets/images/slider.png",
                width: getScreenWidth(context) * 0.25,
              ),
            ],
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/ar_button.png",
                  width: getScreenWidth(context) * 0.35,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/vr_button.png",
                  width: getScreenWidth(context) * 0.35,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(context) * 0.02),
          Row(
            children: [
              SizedBox(
                width: getScreenWidth(context) * 0.06,
              ),
              Text(
                "RM 1,100.00",
                style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getScreenWidth(context) * 0.01,
              ),
              Text(
                "In Stock",
                style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(context) * 0.02),
          Row(
            children: [
              SizedBox(
                width: getScreenWidth(context) * 0.06,
              ),
              Column(
                children: [
                  Container(
                    width: getScreenWidth(context) * 0.8,
                    child: Text(
                      "SF 4-A22 CORDLESS DRILL DRIVER",
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.005),
                  Container(
                      width: getScreenWidth(context) * 0.8,
                      child: Text(
                        "Compact-class cordless 22V drill driver with brushless motor for when you need higher performance during light-duty tasks or in hard-to-reach places",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      )),
                  SizedBox(height: getScreenHeight(context) * 0.005),
                  bulletPoints(
                    context,
                    "• Maximum torque (soft/hard joint): 36 Nm (soft joint), 62 Nm (hard joint)\n•No load RPM: gear 1: 610 rpm; gear 2: 2100 rpm\n•Chuck clamping range: 2 - 13 mm",
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.015),
                  Container(
                    width: getScreenWidth(context) * 0.8,
                    child: Text(
                      "More Technical Data > ",
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.03),
                  redTitle(context, "Features"),
                  bulletPoints(context,
                      "• Compact – at just 178 mm from front to back, this cordless drill driver can fit easily into cramped or hard-to-reach spaces\n• Upgraded performance – now with brushless motor powering up to 2100 rpm and 36 Nm of soft joint torque, helping you complete most light-duty drilling and driving work faster\n• Active Torque Control (ATC) – stops the tool body from spinning uncontrollably if the bit gets stuck, helping to remove a common safety hazard\n• Light, well-balanced drill driver – contoured grips and two bright LEDs for more comfortable handling, especially overhead or on precise finishing work\n• Durable and low-maintenance – full metal chuck and virtually maintenance-free brushless motor help keep you productive under tough jobsite conditions"),
                  SizedBox(height: getScreenHeight(context) * 0.03),
                  redTitle(context, "Applications"),
                  bulletPoints(context,
                      "• Driving screws up to 8 mm diameter in wood\n• Hole sawing up to 82 mm diameter in wood\n• Drilling in steel up to 10 mm diameter\n• Driving screws up to 4.8 mm diameter in steel\n• Drilling with auger and spade bits up to 26 mm diameter in wood"),
                ],
              )
            ],
          )
        ],
      ),
      Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(width: getScreenWidth(context), height: 50, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: getScreenWidth(context) * 0.5, child:
              ElevatedButton(
                onPressed: () {},
                child: Text("Buy Now"),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),)
              ),),
              ElevatedButton(
                onPressed: () {},
                child: Text("Button 2"),
              ),
            ],
          ),))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return cordlessBody(context, _scaffoldKey, _searchText, _pageIndex, _onTap,
        false, bodyFourContent());
    ;
  }
}
