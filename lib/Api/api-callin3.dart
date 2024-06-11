import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling3 extends StatefulWidget {
  const Api_Calling3({super.key});

  @override
  State<Api_Calling3> createState() => _Api_Calling3State();
}

class _Api_Calling3State extends State<Api_Calling3> {
  List Album = [];

  getalbumdata() async {
    try {
      var res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
      Album = jsonDecode(res.body);
      setState(() {});
    } catch (e) {
      debugPrint("error =$e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalbumdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api calling 3"),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: Album.length,
              itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child: Column(
                  children: [
                    Text(Album[index]["userId"].toString()),
                    Text(Album[index]["id"].toString()),
                    Text(Album[index]["title"].toString()),
                  ],
                ),
              );
            },)
          ],
        ),
      )
    );
  }
}
