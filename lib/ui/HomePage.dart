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
  double _scale = 0.7;
  double _borderRadius = 50;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    Color iconColor = Color(0xff86b3b3);
    TextStyle menuText = TextStyle(
        color: Color(0xff86b3b3), fontSize: 24, fontWeight: FontWeight.bold);
    return InnerDrawer(
        backgroundColor: Color(0xff497473),
        key: _innerDrawerKey,
        onTapClose: true,
        offset: IDOffset.only(
            top: _topBottom ? _verticalOffset : 0.0,
            bottom: !_topBottom ? _verticalOffset : 0.0,
            right: MediaQuery.of(context).size.width<450?0.4:0,
            left: MediaQuery.of(context).size.width<450?0.4:0),
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
          appBar: AppBar(
            title: Text("This is title"),
          ),
        ));
  }
}
