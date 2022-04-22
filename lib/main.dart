import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:oneword/decod1.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  FlutterTts flutterTts = FlutterTts();
  AudioPlayer audioPlayer = AudioPlayer();

  List imagelist = [];
  String s1 = "";

  String spelling ="";

  List answerlist = [];
  List bottomlist = [];
  List toplist = [];
  Uint8List? audiobytes;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages();
  }

  Future _initImages() async {


    String audioasset = "audios/popup.wav";
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
     audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.webp'))
        .toList();

    setState(() {
      imagelist = imagePaths;
      print(imagelist);
    });
    setState(() {
      int rr = Random().nextInt(imagelist.length);
      String imagepath = imagelist[rr];
      print("============${imagepath}");
      List<String> list = imagepath.split("/");
      print(list);
      s1 = list[1];



       spelling = imagepath.split("/")[1].split("\.")[0];
      answerlist = spelling.split("");
      print(answerlist);     //[a,p,p,l,e]
      toplist = List.filled(answerlist.length, "");
      String abcd = "abcdefghijklmnopqrstuvwxyz";
      List abcdlist = abcd.split("");
      abcdlist.shuffle();
      bottomlist = abcdlist.getRange(0, 10 - answerlist.length).toList();
      bottomlist.addAll(answerlist);
      bottomlist.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double toolbarheight = kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003F98),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              //   color: Colors.white,
              height: 50,
              width: 50,
              child: Icon(
                Icons.settings,
                color: Colors.black,
                size: 35,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              alignment: Alignment.center,
              //  color: Colors.white,
              height: 50,
              width: 50,
              child: Text(
                "1",
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: AssetImage("images/coin.webp")),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              //  color: Colors.amberAccent,
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: theight * .42,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("images/game_back.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  //    color: Colors.white,
                  height: 160,
                  width: 160,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: theight * .23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage("images/${s1}"))),
                  ),
                ),
                Container(
                  //          alignment: Alignment.centerLeft,
                  height: 50,
                  width: twidth,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: answerlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                        setState(() {
                          audioPlayer.playBytes(audiobytes!);
                          setState(() {
                            if(toplist[index]!="")
                              {
                                bottomlist[map[index]]=toplist[index];
                                toplist[index]="";

                              }
                          });

                          // for(int i=0;i<bottomlist.length;i++)
                          //   {
                          //     if(bottomlist[map[index]]=="")
                          //       {
                          //
                          //         bottomlist[map[index]]=toplist[index];
                          //         toplist[index]="";
                          //         // map[i]=index;
                          //         // print(map);
                          //         break;
                          //       }
                          //   }
                        });
                      },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "${toplist[index]}",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.purple),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.orange.shade200),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            width: twidth,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 10) {
                  return InkWell(onTap: () async {
                  await  flutterTts.speak(spelling);
                  },
                      child: Container(
                    child: Center(
                        child: Icon(
                      Icons.lightbulb,
                      color: Colors.green,
                    )),
                  ));
                }else if (index==11)
                  {
                    return InkWell(onTap: () async {
                        for(int i=0;i<answerlist.length;i++)
                          {
                            await Future.delayed(Duration(seconds: 1));
                            await  flutterTts.speak(answerlist[i]);
                          }
                    },
                        child: Container(
                          child: Center(
                              child: Icon(
                                Icons.lightbulb,
                                color: Colors.red,
                              )),
                        ));
                  }
                else{
                  return InkWell(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < toplist.length; i++) {
                          if (toplist[i] == "") {
                            toplist[i] = bottomlist[index];
                            bottomlist[index] = "";
                            // [where : from]
                            map[i] = index;
                            print(map);

                            break;
                          }
                        }

                        if(listEquals(toplist, answerlist))
                          {
                            print("win");
                          }
                        // if(answerlist.toString()==toplist.toString())
                        // {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        // return winpage();
                        // },));
                        // }
                      });

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 65,
                      margin: EdgeInsets.all(10),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: Colors.orange.shade200),
                      child: Text(
                        "${bottomlist[index]}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                }


              },
            ),
          ),
        ],
      ),
    );
  }

  Map map = {};
}
