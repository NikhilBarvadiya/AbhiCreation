import 'package:flutter/material.dart';class Home_Screen extends StatefulWidget {  const Home_Screen({Key? key}) : super(key: key);  @override  State<Home_Screen> createState() => _Home_ScreenState();}class _Home_ScreenState extends State<Home_Screen> {  List image = [    "assets/Fake/1.jpeg",    "assets/Fake/2.jpeg",    "assets/Fake/3.jpeg",    "assets/Fake/4.jpeg",    "assets/Fake/5.jpeg",    "assets/Fake/6.jpeg",    "assets/Fake/7.jpg",    "assets/Fake/8.jpg",    "assets/Fake/9.jpeg",    "assets/Fake/10.jpg",    "assets/Fake/11.jpg",    "assets/Fake/12.jpg",    "assets/Fake/14.jpg",    "assets/Fake/15.jpg",    "assets/Fake/16.jpg",    "assets/Fake/17.jpg",  ];  List name = [    "White bari",    "Grey bari",    "Blue bari",    "Blue bari",    "Black bari",    "Black 12*6",    "White 12*6",    "Green Choper",    "White Choper",    "Blue Choper",    "Black Choper",    "Grey Choper",    "Red Choper",    "Black GP",    "White GP",    "Gold GP",  ];  @override  Widget build(BuildContext context) {    return Scaffold(      body: Padding(        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),        child: GridView.builder(          physics: const BouncingScrollPhysics(),          shrinkWrap: true,          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(            crossAxisCount: 2,            mainAxisSpacing: 10,            crossAxisSpacing: 10,          ),          itemCount: image.length,          itemBuilder: (BuildContext context, int index) {            return Card(              elevation: 5,              shape: RoundedRectangleBorder(                side: BorderSide(color: Colors.white70, width: 1),                borderRadius: BorderRadius.circular(10),              ),              child: Stack(                children: [                  Container(                    width: MediaQuery.of(context).size.width * 0.5,                    height: MediaQuery.of(context).size.height * 0.5,                    child: Image(                      image: AssetImage("${image[index]}"),                      fit: BoxFit.cover,                    ),                  ),                  Column(                    children: [                      Spacer(),                      Container(                        width: MediaQuery.of(context).size.width * 0.5,                        height: MediaQuery.of(context).size.height * 0.03,                        decoration:                            BoxDecoration(color: Colors.deepOrange),                        alignment: Alignment.center,                        child: Text(                          "${name[index]}",                          style: TextStyle(                            color: Colors.white,                            fontWeight: FontWeight.bold,                          ),                        ),                      ),                    ],                  ),                ],              ),            );          },        ),      ),    );  }}