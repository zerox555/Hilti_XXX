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
                          height: getScreenHeight(context) * 0.5,
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
                  height: getScreenHeight(context) * 0.035,
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
            )));
  }
}
