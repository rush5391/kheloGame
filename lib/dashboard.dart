import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_box/video_box.dart';

import 'constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<VideoController> vcs = [];
  int _current = 0;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 1; i++) {
      vcs.add(VideoController(source: VideoPlayerController.network("https://www.youtube.com/watch?v=_7ZzVls4Lqs"))
        ..initialize());
    }
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 5),
          color: const Color.fromARGB(255, 11, 0, 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(200, 68, 68, 68),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: 120,
                              padding:const EdgeInsets.all(10),
                              child: Text(
                                AppConstants.appName,
                                style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "CalibriBold"),
                              )),
                        ),
                        Container(
                            width: 50,
                            padding:const EdgeInsets.all(10),
                            child:  Center(
                              child: Text(
                                AppConstants.promotions,
                                style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "CalibriBold"),
                              ),
                            )),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: 100,
                              color: const Color.fromARGB(255, 247, 173, 7),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Center(
                                      child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: "CalibriBold"),
                                  )),

                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                //Slider
                Container(
                    child: CarouselSlider(
                      options: CarouselOptions(),
                      items: imgList
                          .map((item) => Container(
                        child:  Center(
                            child:
                            Image.network(item, fit: BoxFit.cover, width: 1000)),
                        color: Colors.green,
                      ))
                          .toList(),
                    )),   SizedBox(
                  height: 2,
                  child: Container(color:const Color.fromARGB(255, 247, 173, 7),),
                ),
                Container(
                  color: Colors.white24,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {},
                            child: Text(AppConstants.english,style:const TextStyle(color: Color.fromARGB(255, 247, 173, 7)),)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 50,
                          width: 60,
                          child: Center(
                              child: Text(
                            AppConstants.hindi,
                            style:const TextStyle(
                              color: Color.fromARGB(255, 247, 173, 7),
                                fontSize: 10,
                                ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 60,
                          child: Center(
                            child: Text(
                              AppConstants.malyalam,
                              style:const TextStyle(
                                  fontSize: 10,
                                color: Color.fromARGB(255, 247, 173, 7),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 60,
                          child: Center(
                            child: Text(
                              AppConstants.telugu,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 247, 173, 7)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        child:Center(
                          child: Text(
                            AppConstants.marathi,
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 247, 173, 7)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                  child: Container(color:const Color.fromARGB(255, 247, 173, 7),),
                ),

                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    width: 300,
                    // height: 180,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoBox(controller: vcs[0],),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 200,
                        child: const Text('Most Popular(15)',style: TextStyle(color: Colors.white,fontSize: 14),)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 247, 173, 7), // Background color
                          ),
                          onPressed: (){}, child: Container(
                        child: const Text('Show More',style: TextStyle(color: Colors.white),),)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {}, //
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                   ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 150,
                          height: 100,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                   ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white24,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 40,
              width: 80,
              child: InkWell(
                onTap: () {
                },
                child: Material(
                  borderRadius: BorderRadius.circular(2.0),
                  shadowColor:Color.fromARGB(255, 247, 173, 7),
                  color: Color.fromARGB(255, 247, 173, 7),
                  elevation: 7.0,
                  child: const Center(
                    child: Text(
                      'Support',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 80,
              child: InkWell(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(2.0),
                  shadowColor: Colors.black,
                  color: Colors.black,
                  elevation: 7.0,
                  child: const Center(
                    child: Text(
                      'Sports',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 80,
              child: InkWell(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(2.0),
                  shadowColor: Colors.black,
                  color: Colors.black,
                  elevation: 7.0,
                  child: const Center(
                    child: Text(
                      'Live Casino',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 80,
              child: InkWell(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(2.0),
                  shadowColor: Color.fromARGB(255, 247, 173, 7),
                  color: Color.fromARGB(255, 247, 173, 7),
                  elevation: 7.0,
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

}