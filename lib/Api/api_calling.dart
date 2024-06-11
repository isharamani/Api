import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key});

  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  List posts = [];

  getapissData() async {
    try {
      var res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      posts = jsonDecode(res.body);
      setState(() {});
    } catch (e) {
      debugPrint("Error $e");
    }
  }

  @override
  void initState() {
    getapissData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Calling"),
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
             SingleChildScrollView(
               child: ListView.builder(
                 physics: ScrollPhysics(),
                 itemCount: posts.length,
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                 return Container(
                   color: Colors.yellow,
                   child: SingleChildScrollView(scrollDirection: Axis.vertical,
                     child: Column(
                       children: [
                         Text(posts[index]["id"].toString()),
                         Text(posts[index]["title"].toString()),
                         Text(posts[index]["userId"].toString()),
                         Text(posts[index]["body"].toString()),
                       ],
                     ),
                   ),
                 );
               },),
             )
            ],
          ),
        ));
  }
}
