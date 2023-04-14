import 'package:flutter/material.dart';

const Color hiltiRed = Color(0xFFD50026);
const Color hiltiWhite = Colors.white;

double getScreenWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}

double getScreenHeight(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight;
}

Image hiltiLogo(BuildContext context, double width) {
  Image hiltiLogo = Image.asset(
    "assets/images/hilti_logo.png",
    width: getScreenWidth(context) * width,
  );
  return hiltiLogo;
}

var banner = [
  "assets/images/banner1.png",
  "assets/images/banner2.png",
  "assets/images/banner3.png",
  "assets/images/banner4.png",
];

var previewImage = [
  "assets/images/drill_drivers/sf_4.jpg",
  "assets/images/previewImages/pic1.png",
  "assets/images/previewImages/pic2.jpg",
  "assets/images/previewImages/pic3.jpg",
  "assets/images/previewImages/pic4.jpg",
];

Container individualItem(BuildContext context, String image, item) {
  return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      width: getScreenWidth(context) * 0.52,
      height: getScreenHeight(context) * 0.085,
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
            image,
            width: getScreenWidth(context) * 0.085,
          ),
          SizedBox(width: getScreenWidth(context) * 0.03),
          Expanded(
              child: Center(
                  child: Text(
            item,
            style: TextStyle(fontFamily: "Helvetica"),
          )))
        ],
      ));
}

Column itemCategories(
    BuildContext context, String image1, image2, item1, item2) {
  return Column(children: [
    individualItem(context, image1, item1),
    SizedBox(height: getScreenHeight(context) * 0.005),
    individualItem(context, image2, item2),
  ]);
}

Container trainingContainer(
    BuildContext context, String image, trainingName, price) {
  return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
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
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image.asset(
            image,
            width: getScreenWidth(context) * 0.3,
          ),
        ),
        SizedBox(
          width: getScreenWidth(context) * 0.03,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getScreenHeight(context) * 0.01,
            ),
            Center(
              child: Text(
                trainingName,
                style: TextStyle(fontFamily: "Helvetica"),
              ),
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.01,
            ),
            Text(
              price,
              style: TextStyle(
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold,
                  color: hiltiRed),
            ),
          ],
        )
      ]));
}

Container navBar(
    BuildContext context, int pageIndex, Function(int) onTapCallback) {
  // set container for the elevation and CLipRRect for orignal shape
  return Container(
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
          currentIndex: pageIndex,
          onTap: onTapCallback,
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ));
}

Container singleCordless(BuildContext context, String image, item) {
  return Container(
    padding: EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 4.0),
    width: getScreenWidth(context) * 0.4,
    height: getScreenHeight(context) * 0.25,
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
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            image,
            width: getScreenWidth(context) * 0.16,
          ),
          SizedBox(height: getScreenHeight(context) * 0.03),
          Text(
            item,
            style: TextStyle(fontFamily: "Helvetica", fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Row cordlessItems(BuildContext context, String image1, image2, item1, item2) {
  return Row(
    children: [
      SizedBox(
        width: getScreenWidth(context) * 0.1,
      ),
      singleCordless(context, image1, item1),
      SizedBox(
        width: getScreenWidth(context) * 0.02,
      ),
      singleCordless(context, image2, item2),
      SizedBox(
        height: getScreenHeight(context) * 0.02,
      ),
    ],
  );
}

GestureDetector cordlessBody(
    BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey,
    String _searchText,
    int _pageIndex,
    dynamic Function(int) _onTap,
    bool showBottomNavigationBar,
    Widget bodyContent) {
  return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey, // to pinpoint towards the scaffold
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: hiltiRed,
          toolbarHeight: getScreenHeight(context) * 0.1,
          automaticallyImplyLeading: false, // disable default back button
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Row(
            children: [
              SizedBox(
                width: getScreenWidth(context) * 0.6,
                height: getScreenHeight(context) * 0.05,
                child: TextField(
                  onChanged: (text) {
                    _searchText = text;
                  },
                  style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: getScreenHeight(context) * 0.022,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: getScreenHeight(context) * 0.03,
                      ),
                      filled: true,
                      fillColor: hiltiWhite,
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: getScreenHeight(context) * 0.022,
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
                width: getScreenWidth(context) * 0.05,
              ),
              Icon(
                Icons.shopping_cart,
                color: hiltiWhite,
                size: getScreenHeight(context) * 0.05,
              ),
            ],
          ),
        ),
        bottomNavigationBar: showBottomNavigationBar ? navBar(context, _pageIndex, _onTap) : null,
        body: bodyContent,
      ));
}

Column buildTitle(BuildContext context, String title, Widget page) {
  return Column(children: [
    SizedBox(
      height: getScreenHeight(context) * 0.03,
    ),
    Center(
        child: Text(
      title,
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
    page
  ]);
}

Container driverItem(
    BuildContext context, String image, price, item, description) {
  return Container(
      padding: EdgeInsets.fromLTRB(8, 28, 8, 0),
      margin: const EdgeInsets.only(bottom: 4.0),
      width: getScreenWidth(context) * 0.8,
      height: getScreenHeight(context) * 0.26,
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
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: getScreenWidth(context) * 0.21,
              ),
              SizedBox(height: getScreenHeight(context) * 0.02),
              Expanded(
                  child: Text(
                price,
                style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          SizedBox(
            width: getScreenWidth(context) * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: getScreenWidth(context) * 0.4,
                  child: Text(
                    item,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )),
              SizedBox(height: getScreenHeight(context) * 0.01),
              Container(
                width: getScreenWidth(context) * 0.4,
                child: Text(
                  description,
                  style: TextStyle(fontFamily: "Helvetica", fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                ),
              )
            ],
          )
        ],
      ));
}

Container redTitle(BuildContext context, String text){
  return Container(
    width: getScreenWidth(context) * 0.8,
    child: Text(
      text,
      style: TextStyle(
        fontFamily: "Helvetica",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: hiltiRed,
      ),
    ),
  );
}

Container bulletPoints(BuildContext context, String text) {
  return Container(
    width: getScreenWidth(context) * 0.8,
    child: Text(text,
      overflow: TextOverflow.ellipsis,
      maxLines: 100,
      style: TextStyle(height: 1.5),
    ),
  );
}