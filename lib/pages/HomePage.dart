import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/pages/cordlessOne.dart';
import 'package:hilti_xxx/utils/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'itemPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // using a global key to reference Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // search box
  String _searchText = "";
  int _hintIndex = 0;
  int _pageIndex = 0;
  List<String> _hintList = ['Saws', 'Screwdrivers', 'Hammers', 'Firestops'];
  List<String> bannerImages = []; // banner images
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to change the hint text every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _hintIndex = (_hintIndex + 1) % _hintList.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel the timer to avoid memory leaks
    _timer?.cancel();
  }

  void _onTap(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: _scaffoldKey, // to pinpoint towards the scaffold
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Transform.translate(
                  offset: Offset(0, getScreenHeight(context) * -0.4),
                  child: OverflowBox(
                      child: Container(
                          height: getScreenHeight(context) * 0.52,
                          decoration: BoxDecoration(
                            color: hiltiRed,
                            borderRadius: BorderRadius.circular(80),
                          )))),
              Column(children: [
                SizedBox(
                  height: getScreenHeight(context) * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: Icon(
                        Icons.menu,
                        color: hiltiWhite,
                        size: getScreenHeight(context) * 0.05,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(context) * 0.045),
                        child: hiltiLogo(context, 0.6)),
                    Icon(
                      Icons.shopping_cart,
                      color: hiltiWhite,
                      size: getScreenHeight(context) * 0.05,
                    ),
                  ],
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.03,
                ),
                SizedBox(
                  width: getScreenWidth(context) * 0.9,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _searchText = text;
                      });
                    },
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: getScreenHeight(context) * 0.025,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: hiltiWhite,
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: _hintList[_hintIndex],
                        hintStyle: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: getScreenHeight(context) * 0.025,
                            color: Colors.grey),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ))),
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.03,
                ),
                Container(
                  width: getScreenWidth(context) * 0.9,
                  height: getScreenHeight(context) * 0.2,
                  child: Swiper(
                    itemCount: banner.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                            image: AssetImage(banner[index]), fit: BoxFit.fill),
                      );
                    },
                    scale: 0.9,
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.grey, activeColor: hiltiRed),
                    ),
                    control: SwiperControl(
                      color: hiltiRed,
                    ),
                    autoplay: true,
                    autoplayDelay: 4000, // switch images every 4 seconds
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.02),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: getScreenWidth(context) * 0.06,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: getScreenHeight(context) * 0.025,
                        fontWeight: FontWeight.bold,
                        color: hiltiRed),
                  )
                ]),
                SizedBox(height: getScreenHeight(context) * 0.015),
                Container(
                    height: getScreenHeight(context) * 0.21,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: getScreenWidth(context) * 0.06),
                        Column(children: [
                          GestureDetector(
                            onTap: () {
                              //go into itemPage
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => itemPage()));
                            },
                            child: individualItem(
                                context,
                                "assets/images/items/cordless_tools.png",
                                "Cordless Tools"),
                          ),
                          SizedBox(height: getScreenHeight(context) * 0.005),
                          individualItem(
                              context,
                              "assets/images/items/power_tools.png",
                              "Power Tools"),
                        ]),
                        SizedBox(width: getScreenWidth(context) * 0.035),
                        itemCategories(
                            context,
                            "assets/images/items/software.png",
                            "assets/images/items/dust_management.png",
                            "Software",
                            "Dust Management & Cleaning"),
                        SizedBox(width: getScreenWidth(context) * 0.035),
                        itemCategories(
                            context,
                            "assets/images/items/tool_inserts.png",
                            "assets/images/items/direct_fastening.png",
                            "Tool Inserts",
                            "Direct Fastening"),
                        SizedBox(width: getScreenWidth(context) * 0.035),
                        itemCategories(
                            context,
                            "assets/images/items/fasteners.png",
                            "assets/images/items/firestop.png",
                            "Fasteners",
                            "Firestop & Fire Protection"),
                        SizedBox(width: getScreenWidth(context) * 0.035),
                        itemCategories(
                            context,
                            "assets/images/items/modular_support.png",
                            "assets/images/items/construction_chemicals.png",
                            "Modular Support System",
                            "Construction Chemicals"),
                        SizedBox(width: getScreenWidth(context) * 0.035),
                        itemCategories(
                            context,
                            "assets/images/items/services.png",
                            "assets/images/items/on_track.png",
                            "Services",
                            "ON!Track Asset Management"),
                        SizedBox(width: getScreenWidth(context) * 0.06),
                      ],
                    )),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: getScreenWidth(context) * 0.06,
                  ),
                  Text(
                    "Training Course",
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: getScreenHeight(context) * 0.025,
                        fontWeight: FontWeight.bold,
                        color: hiltiRed),
                  )
                ]),
                SizedBox(height: getScreenHeight(context) * 0.015),
                Container(
                  height: getScreenHeight(context) * 0.13,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: getScreenWidth(context) * 0.06),
                      trainingContainer(
                          context,
                          "assets/images/training/firestop_basics.png",
                          "Firestop \nExecutive Basics",
                          "From RM 349.45"),
                      SizedBox(
                        width: getScreenWidth(context) * 0.035,
                      ),
                      trainingContainer(
                          context,
                          "assets/images/training/technical_training.jpg",
                          "Technical Training",
                          "From RM 149.45"),
                      SizedBox(
                        width: getScreenWidth(context) * 0.035,
                      ),
                      trainingContainer(
                          context,
                          "assets/images/training/choosing_cordless.jpg",
                          "Cordless Power \nToolss Training",
                          "From RM 299.55"),
                      SizedBox(width: getScreenWidth(context) * 0.06),
                    ],
                  ),
                )
              ]),
              Transform.translate(
                offset: Offset(getScreenWidth(context) * 0.72,
                    getScreenHeight(context) * 0.79),
                child: GestureDetector(
                    onTap: () {
                      // pop up chat
                    },
                    child: Image.asset(
                      "assets/images/chat.png",
                      width: getScreenWidth(context) * 0.35,
                    )),
              )
            ]),
            drawer: Container(
              width: getScreenWidth(context) * 0.75,
              child: Drawer(
                child: ListView(
                  children: [
                    SizedBox(
                        height: getScreenHeight(context) * 0.15,
                        child: DrawerHeader(
                          child: Text("Header"),
                          decoration: BoxDecoration(color: hiltiRed),
                        )),
                    ListTile(
                      title: Text("Item 1"),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Item 2"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: navBar(context, _pageIndex, _onTap)));
  }
}
