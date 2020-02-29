import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:product_ui/ui/AnimalDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class CategoryData {
  String imageName;
  String categoryName;

  CategoryData({this.categoryName, this.imageName});
}

class AnimalData {
  String imageName;
  String animalName;
  String gender;
  String categoryName;
  String age;
  String distance;
  int backgroundColor;

  AnimalData(
      {this.animalName,
      this.imageName,
      this.categoryName,
      this.gender,
      this.distance,
      this.age,
      this.backgroundColor});
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
  List<CategoryData> categoryList = [
    CategoryData(categoryName: "Cats", imageName: "cat.png"),
    CategoryData(categoryName: "Dogs", imageName: "dog.png"),
    CategoryData(categoryName: "Parrots", imageName: "parrot.png"),
    CategoryData(categoryName: "Turtles", imageName: "turtle.png"),
    CategoryData(categoryName: "Elephants", imageName: "elephant.png"),
    CategoryData(categoryName: "Fishs", imageName: "fish.png"),
  ];

  List<AnimalData> animalList = [
    AnimalData(
        imageName: "cat_PNG50529.png",
        categoryName: "Abyssinian cat",
        gender: "gender.png",
        backgroundColor: 0xffdde3b3,
        age: "2",
        animalName: "Sola",
        distance: "7.8"),
    AnimalData(
        imageName: "cat2.png",
        categoryName: "Abyssinian cat",
        gender: "girl.png",
        backgroundColor: 0xffead0aa,
        age: "1.2",
        animalName: "Orion",
        distance: "2"),
    AnimalData(
        imageName: "cat3.png",
        categoryName: "Abyssinian cat",
        gender: "gender.png",
        backgroundColor: 0xffdadee8,
        age: "1.4",
        animalName: "Lisa",
        distance: "5.2"),
  ];

  int currentIndex = 0;

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
                      "Mona Lisa",
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
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
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
                      child: SingleChildScrollView(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: TextFormField(
                                      cursorColor:
                                          Theme.of(context).accentColor,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        hintText: "Search",
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.sort),
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      child: categoryBox(
                                          name:
                                              categoryList[index].categoryName,
                                          imageName:
                                              categoryList[index].imageName,
                                          isSelected: index == currentIndex),
                                    );
                                  },
                                  itemExtent: 90,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: categoryList.length,
                                )),
                            ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return AnimalDetailPage(
                                          categoryName:
                                              animalList[index].categoryName,
                                          age: animalList[index].age,
                                          animalName:
                                              animalList[index].animalName,
                                          gender: animalList[index].gender,
                                      index: index,
                                           backgroundColor: animalList[index].backgroundColor,
                                        );
                                      }));
                                    },
                                    child: animalBox(context,
                                        distance: animalList[index].distance,
                                        animalName:
                                            animalList[index].animalName,
                                        age: animalList[index].age,
                                        gender: animalList[index].gender,
                                        categoryName:
                                            animalList[index].categoryName,
                                        imageName: animalList[index].imageName,
                                        backgroundColor:
                                            animalList[index].backgroundColor));
                              },
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: animalList.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget animalBox(BuildContext context,
      {imageName,
      animalName,
      categoryName,
      age,
      gender,
      distance,
      int backgroundColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        height: 270,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.07),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: Offset(0, 10))
                        ],
                        color: Color(backgroundColor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 220,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.07),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: Offset(0, 10))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 180,
                    width: MediaQuery.of(context).size.width / 2 - 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "$animalName",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/${gender}",
                                width: 30,
                                height: 30,
                                color: Colors.black54,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$categoryName",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$age Year old",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Color(0xff497473),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "Distance: $distance km",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Hero(
                tag: imageName,
                child: Image.asset(
                  "assets/$imageName",
                  height: 220,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryBox({name, imageName, bool isSelected}) {
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
                    color: isSelected
                        ? Color(0xff497473).withOpacity(0.3)
                        : Colors.black.withOpacity(0.05),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 5)
              ],
              color: isSelected ? Color(0xff497473) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/$imageName",
              color: isSelected ? Colors.white : Color(0xff497473),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("$name")
      ],
    );
  }
}
