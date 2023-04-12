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
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(5),
                          content: Container(
                            height: getScreenHeight(context) * 0.4,
                            child: Swiper(
                              itemCount: previewImage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image(
                                    image: AssetImage(previewImage[index]),
                                    fit: BoxFit.cover);
                              },
                              control: SwiperControl(
                                color: hiltiRed,
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Image.asset(
                  "assets/images/drill_drivers/sf_4.jpg",
                  width: getScreenWidth(context) * 0.5,
                ),
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
                  SizedBox(height: getScreenHeight(context) * 0.1),
                ],
              )
            ],
          )
        ],
      ),
      Positioned(
          left: 0,
          right: 0,
          bottom: -getScreenHeight(context) * 0.01,
          child: Container(
            width: getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: SizedBox(
                        height: getScreenHeight(context) * 0.08,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Buy Now"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(218, 158, 49, 1)),
                            )))),
                Expanded(
                    child: SizedBox(
                  height: getScreenHeight(context) * 0.08,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Row(
                                    children: [
                                      Text(
                                        "Purchase Information",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontWeight: FontWeight.bold),
                                      ),
                                  SizedBox(width: getScreenWidth(context) * 0.15,),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.clear),
                                  )],
                                  ),
                                  insetPadding:
                                      EdgeInsets.symmetric(vertical: 95, ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Package Content",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: getScreenWidth(context) * 0.6,
                                        child: Text(
                                          "• 1x Cordl drill driver SF 4-A22 ATC\n•1x Tool case SF 4-A22 assy",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 100,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.02),
                                      Text(
                                        "Pack Size",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "• 1 piece",
                                        style:
                                            TextStyle(fontFamily: "Helvetica"),
                                      ),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.03),
                                      Text(
                                        "Discounted Net",
                                        style:
                                            TextStyle(fontFamily: "Helvetica"),
                                      ),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.01),
                                      Text(
                                        "RM1,100.00",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("See Fleet Price >",
                                          style: TextStyle(
                                              fontFamily: "Helvetica",
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.03),
                                      Text(
                                        "Quantity",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.01),
                                      Container(
                                        width: getScreenWidth(context) * 0.5,
                                        height:
                                            getScreenHeight(context) * 0.055,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(top: 2, left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Packs",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              getScreenHeight(context) * 0.03),
                                      SizedBox(
                                        width: getScreenWidth(context) * 0.8,
                                        child: ElevatedButton.icon(
                                          icon: Icon(Icons.shopping_cart,
                                              size: 20),
                                          label: Text(
                                            'Add to Cart',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(hiltiRed),
                                          ),
                                          onPressed: () => {},
                                        ),
                                      ),
                                    ],
                                  ));
                            });
                      },
                      child: Text("Add to Cart"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(hiltiRed),
                      )),
                ))
              ],
            ),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return cordlessBody(context, _scaffoldKey, _searchText, _pageIndex, _onTap,
        false, bodyFourContent());
    ;
  }
}
