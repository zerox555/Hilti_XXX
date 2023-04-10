import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hilti_xxx/utils/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                        color: hiltiWhite),
                    cursorColor: hiltiWhite,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white70),
                        hintText: _hintList[_hintIndex],
                        hintStyle: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: getScreenHeight(context) * 0.025,
                            color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: hiltiWhite),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: hiltiWhite,
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
                        itemCategories(
                            context,
                            "assets/images/items/cordless_tools.png",
                            "assets/images/items/power_tools.png",
                            "Cordless Tools",
                            "Power Tools"),
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
                      Container(
                          padding: EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 4.0),
                          width: getScreenWidth(context) * 0.7,
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
                                "assets/images/items/firestop.png",
                              ),
                            ],
                          )),
                      SizedBox(
                        width: getScreenWidth(context) * 0.035,
                      ),
                      Container(
                        color: Colors.orangeAccent,
                        height: 10,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text("Hey"),
                      )
                    ],
                  ),
                )
              ]),
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
            // set container for the elevation and CLipRRect for orignal shape
            bottomNavigationBar: Container(
                height: getScreenHeight(context) * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: hiltiWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 10.0,
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    selectedItemColor: hiltiRed,
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: true,
                    selectedLabelStyle: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: getScreenHeight(context) * 0.018,
                        color: hiltiRed),
                    unselectedLabelStyle: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: getScreenHeight(context) * 0.018,
                        color: Colors.grey),
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.dynamic_feed), label: "Feed"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.message), label: "Messages"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.bike_scooter), label: "Order"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Profile"),
                    ],
                  ),
                ))));
  }
}
