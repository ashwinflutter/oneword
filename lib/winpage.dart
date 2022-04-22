import 'package:flutter/material.dart';

class winpage extends StatefulWidget {
  const winpage({Key? key}) : super(key: key);

  @override
  _winpageState createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  List answerlist = [];
  List bottomlist = [];
  List toplist = [];



  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double naviheight = MediaQuery.of(context).padding.bottom;
    double toolbarheight = kToolbarHeight;
    double bodyheight = theight - statusbarheight - toolbarheight - naviheight;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: toolbarheight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/score_text.png"))),
                  alignment: Alignment.center,
                  height: 70,
                  width: 350,
                  child: Text(
                    "Very Nice Play",
                    style: TextStyle(fontSize: 25, color: Colors.amber),
                  ),
                ),
              ],
            ),
            Container(
              height: theight * .55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/score_star.png"))),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                   
                    setState(() {

                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    // color: Colors.black26,
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, spreadRadius: 5),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
