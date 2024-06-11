import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling1 extends StatefulWidget {
  const Api_Calling1({super.key});

  @override
  State<Api_Calling1> createState() => _Api_Calling1State();
}

class _Api_Calling1State extends State<Api_Calling1> {
  List photo = [];

  getphotoData() async {
    try {
      var res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      photo = jsonDecode(res.body);
      setState(() {});
    } catch (e) {
      debugPrint("Errorr = $e");
    }
  }

  @override
  void initState() {

    super.initState();
   getphotoData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("APi calling 1",),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: photo.length,
              itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child: Column(
                  children: [
                    Text(photo[index]["albumId"].toString()),
                    Text(photo[index]["id"].toString()),
                    Text(photo[index]["title"].toString()),
                    Text(photo[index]["url"].toString()),
                   Text(photo[index]["thumbnailUrl"].toString()),
                  ],
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}


