import 'dart:convert';
import 'package:flutter_getx/detail_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:get/get.dart';
import 'content_page.dart';
import 'my_home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List imgs = [];
  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/img.json").then((s) {
      setState(() {
        imgs = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    final DetailController fav = Get.put(DetailController());
    return Scaffold(
      body: Container(
        color: Color(0xFFc5e5f3),
        child: Stack(
          children: [
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  onPressed: () => Get.to(() => ContentPage()),
                  icon: Icon(Icons.home_outlined),
                )),
            Positioned(
              top: 100,
              left: 0,
              height: 80,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          Get.arguments['img'],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Preacher",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 10,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFf3fafc)),
                        child: Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: 250,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFfcfffe),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: Offset(0, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 10),
                  child: Column(
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Text(
                            Get.arguments['title'],
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container())
                        ],
                      )),
                      SizedBox(height: 20),
                      Container(
                        width: width,
                        child: Text(
                          Get.arguments['text'],
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.watch_later, color: Color(0xFF69c5df)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments['name'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    Get.arguments['time'],
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "499",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFfbc33e)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 540,
                left: 25,
                height: 50,
                child: Container(
                  child: RichText(
                      text: TextSpan(
                          text: "Total Participants ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black),
                          children: [
                        TextSpan(
                            text: "(11)",
                            style: TextStyle(color: Color(0xFFfbc33e)))
                      ])),
                )),
            //images
            Stack(children: [
              for (int i = 0; i < imgs.length; i++)
                Positioned(
                  top: 590,
                  left: (20 + i * 35).toDouble(),
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage(imgs[i]['img']),
                            fit: BoxFit.cover)),
                  ),
                )
            ]),
            //favourite
            Positioned(
                top: 670,
                left: 25,
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFfbc33e)),
                        child: IconButton(
                            icon: Icon(Icons.favorite_border, size: 18),
                            onPressed: () => fav.favCounter(),
                            color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add to favorite",
                      style: TextStyle(color: Color(0xFFfbc33e), fontSize: 18),
                    )
                  ],
                ))
            //))
          ],
        ),
      ),
    );
  }
}
