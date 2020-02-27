import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
  GlobalKey<InnerDrawerState>();
  bool _swipe = true;
  InnerDrawerAnimation _animationType = InnerDrawerAnimation.static;
  bool _proportionalChildArea = true;
  double _verticalOffset = 0.0;
  bool _topBottom = false;
  double _scale = 0.9;
  double _borderRadius = 50;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    Color iconColor = Color(0xff86b3b3);
    TextStyle menuText = TextStyle(
        color: Color(0xff86b3b3), fontSize: 24, fontWeight: FontWeight.w500);
    return InnerDrawer(
        backgroundColor: Color(0xff497473),
        key: _innerDrawerKey,
        onTapClose: true,
        offset: IDOffset.only(
            top: _topBottom ? _verticalOffset : 0.0,
            bottom: !_topBottom ? _verticalOffset : 0.0,
            right: MediaQuery.of(context).size.width < 450 ? 0.4 : 0,
            left: MediaQuery.of(context).size.width < 450 ? 0.4 : 0),
        scale: IDOffset.horizontal(_scale),
        borderRadius: _borderRadius,
        duration: Duration(milliseconds: 11200),
        swipe: _swipe,
        proportionalChildArea: _proportionalChildArea,
        leftAnimationType: _animationType,
        leftChild: Material(
          color: Color(0xff497473),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff2f6060), Color(0xff497473)])),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/adult-1867889_640.jpg"),
                    ),
                    title: Text(
                      "Adoption",
                      style: menuText,
                    ),
                    subtitle: Text(
                      "Active Status",
                      style: TextStyle(color: iconColor),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.local_convenience_store,
                            color: iconColor,
                          ),
                          title: Text(
                            "Adoption",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.monetization_on,
                            color: iconColor,
                          ),
                          title: Text(
                            "Donation",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.add_circle_outline,
                            color: iconColor,
                          ),
                          title: Text(
                            "Add pet",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.favorite,
                            color: iconColor,
                          ),
                          title: Text(
                            "Favorites",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.message,
                            color: iconColor,
                          ),
                          title: Text(
                            "Message",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: iconColor,
                          ),
                          title: Text(
                            "Profile",
                            style: menuText,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: iconColor,
                          ),
                          title: Text(
                            "Setting",
                            style: menuText,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: iconColor,
                    ),
                    title: Text(
                      "Logout",
                      style: menuText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        scaffold: Scaffold(
          body: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _innerDrawerKey.currentState.toggle();
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 14),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Color(0xff497473),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Surat,",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "India",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/adult-1867889_640.jpg"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                    color: Colors.white),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextFormField(
                                    cursorColor: Theme.of(context).accentColor,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Search",
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.sort),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: ListView(
                              itemExtent: 80,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: <Widget>[
                                categoryBox(),
                                categoryBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Column categoryBox() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xff497473).withOpacity(0.3),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 5)
              ],
              color: Color(0xff497473),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/cat.png",
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Cats")
      ],
    );
  }
}
