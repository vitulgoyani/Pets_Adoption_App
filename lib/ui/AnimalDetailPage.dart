import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AnimalDetailPage extends StatefulWidget {
  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
  String animalName;
  String gender;
  String categoryName;
  String age;
  int index;
  int backgroundColor;

  AnimalDetailPage(
      {this.age,
      this.categoryName,
      this.gender,
      this.animalName,
      this.index,
      this.backgroundColor});
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  bool isFavorite = false;
  final List<String> imgList = [
    "cat_PNG50529.png",
    "cat2.png",
    "cat3.png",
  ];

  CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
    return CarouselSlider(
      viewportFraction: 1.0,
      aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
      initialPage: widget.index,
      items: imgList.map(
        (url) {
          return Container(
            color: Color(widget.backgroundColor),
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Hero(
                tag: url,
                child: Image.asset(
                  "assets/$url",
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  addFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: getFullScreenCarousel(context),
                      ),
                      SafeArea(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                icon: Icon(Platform.isAndroid
                                    ? Icons.arrow_back
                                    : Icons.arrow_back_ios),
                                onPressed: () {
                                  Navigator.pop(context);
                                })),
                      ),
                      SafeArea(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.system_update_alt),
                                onPressed: () {})),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/adult-1867889_640.jpg"),
                          ),
                          title: Text(
                            "Mona Lisa",
                            style: TextStyle(),
                          ),
                          subtitle: Text(
                            "Owner",
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: Text(
                            "May 25,2020",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "My job requires moving to another country. I don't have the oppotunity to take the cat with me. I am looking for good people who will shetter my cat.",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.animalName}",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              "assets/${widget.gender}",
                              width: 30,
                              height: 30,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.categoryName}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            Text(
                              "${widget.age} Year old",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
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
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                "5 Bulvarno-Kudriavska Street, Surat",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        addFavorite();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.height / 11,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ]),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 11,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(0, 5))
                          ]),
                      child: Center(
                          child: Text(
                        "Adoption",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
