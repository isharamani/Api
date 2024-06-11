import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling2 extends StatefulWidget {
  const Api_Calling2({super.key});

  @override
  State<Api_Calling2> createState() => _Api_Calling2State();
}

class _Api_Calling2State extends State<Api_Calling2> {
  List Comments = [];

  getCommentData() async {
    try {
      var res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      Comments = jsonDecode(res.body);
      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCommentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling2"),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: Comments.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.yellow,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Text(Comments[index]["postId"].toString()),
                          Text(Comments[index]["id"].toString()),
                          Text(Comments[index]["email"].toString()),
                          Text(Comments[index]["name"].toString()),
                          Text(Comments[index]["body"].toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
