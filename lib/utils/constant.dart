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

Container individualItem(BuildContext context, String image, item) {
  return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 4.0),
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

Column itemCategories(BuildContext context, String image1, image2,
    item1, item2) {
  return Column(children: [
    individualItem(context, image1, item1),
    SizedBox(height: getScreenHeight(context) * 0.005),
    individualItem(context, image2, item2),
  ]);
}

Container trainingContainer(BuildContext context, String image, trainingName, price) {
  return Container(
      padding: EdgeInsets.all(8),
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
                SizedBox(height: getScreenHeight(context) * 0.01,),
                Center(
                  child: Text(
                    trainingName,
                    style:
                    TextStyle(fontFamily: "Helvetica"),
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.01,),
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

Container navBar(BuildContext context, int pageIndex, Function(int) onTapCallback) {
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
          ]
      ),
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
              color: hiltiRed
          ),
          unselectedLabelStyle: TextStyle(
              fontFamily: "Helvetica",
              fontSize: getScreenHeight(context) * 0.018,
              color: Colors.grey
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dynamic_feed),
                label: "Feed"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Messages"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bike_scooter),
                label: "Order"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
            ),
          ],
        ),
      )
  );
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
      SizedBox(width: getScreenWidth(context) * 0.1,),
      singleCordless(context, image1, item1),
      SizedBox(width: getScreenWidth(context) * 0.02,),
      singleCordless(context, image2, item2),
      SizedBox(height: getScreenHeight(context) * 0.02,),
    ],
  );

}


