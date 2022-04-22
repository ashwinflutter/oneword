import 'package:flutter/material.dart';

class decod1 extends StatefulWidget {
  const decod1({Key? key}) : super(key: key);

  @override
  State<decod1> createState() => _decod1State();
}

class _decod1State extends State<decod1> {

  Map map1 = {
    "id":"487349",
    "name":"Pooja Bhaumik",
    "score" : true
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Welcome mm = Welcome.fromJson(map1);

    print("ID=${mm.id} = NAME=${mm.name}==Score=${mm.score}");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Welcome {

  String id;
  String name;
  bool score;


  Welcome(this.id, this.name, this.score); // {
  // "id":"487349",
  // "name":"Pooja Bhaumik",
  // "score" : 1000
  // }

  factory Welcome.fromJson(Map map1) {

    return Welcome(map1['id'], map1['name'], map1['score']);
  }
}
