import 'package:flutter/material.dart';
import 'package:hilti_xxx/utils/constant.dart';

import 'HomePage.dart';
import 'cordlessOne.dart';
import 'cordlessTwo.dart';

class itemPage extends StatefulWidget {
  const itemPage({Key? key}) : super(key: key);

  @override
  State<itemPage> createState() => _itemPageState();

}

class _itemPageState extends State<itemPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _searchText = "";
  int _pageIndex = 0;



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
          appBar: AppBar(
            backgroundColor: hiltiRed,
            toolbarHeight: getScreenHeight(context) * 0.1,
            title: Row(
              children: [
                SizedBox(
                  width: getScreenWidth(context) * 0.6,
                  height: getScreenHeight(context) * 0.05,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _searchText = text;
                      });
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
                SizedBox(width: getScreenWidth(context) * 0.05,),
                Icon(
                  Icons.shopping_cart,
                  color: hiltiWhite,
                  size: getScreenHeight(context) * 0.05,
                ),
              ],
            ),
          ),
          // changing only the body with Navigator
          // routes ==> /homePage/cordlessOne/cordlessTwo
          body:  Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              WidgetBuilder builder;
              switch (settings.name) {
                case '/':
                  builder = (BuildContext _) => cordlessOne();
                  break;
                case '/second':
                  builder = (BuildContext _) => cordlessTwo();
                  break;
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              return MaterialPageRoute(builder: builder, settings: settings);
            },
          ),
          bottomNavigationBar: navBar(context, _pageIndex, _onTap),
        ));
  }
}
