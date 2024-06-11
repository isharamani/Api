import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling6 extends StatefulWidget {
  const Api_Calling6({super.key});

  @override
  State<Api_Calling6> createState() => _Api_Calling6State();
}

class _Api_Calling6State extends State<Api_Calling6> {


  List All =[];

  getAlllData() async {
    try{
      var res = await http.get(Uri.parse("https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7"));
      All = jsonDecode(res.body);
      setState(() {

      });
    }
    catch(e){
      debugPrint("error=$e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api calling 6"),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              itemCount:All.length ,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child:Column(
                  children: [
                    Text(All[index]["success"].toString())
                  ],
                )
                ,
              );
            },)
          ],
        ),
      ),
    );
  }
}
