import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling4 extends StatefulWidget {
  const Api_Calling4({super.key});

  @override
  State<Api_Calling4> createState() => _Api_Calling4State();
}

class _Api_Calling4State extends State<Api_Calling4> {
  
  List todos = [];
  
  getTodosData() async {
    try{
      var res= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      todos=jsonDecode(res.body);
      setState(() {
        
      });
    }
    catch(e){
      debugPrint("Error = $e");
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodosData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Calling 4"),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              itemCount: todos.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child: Column(
                children: [
                  Text(todos[index]["userId"].toString()),
                  Text(todos[index]["id"].toString()),
                  Text(todos[index]["title"].toString()),
                  Text(todos[index]["completed"].toString()),
                ],
              ),);
            },)
          ],
        ),
      ),
    );
  }
}
