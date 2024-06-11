import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling5 extends StatefulWidget {
  const Api_Calling5({super.key});

  @override
  State<Api_Calling5> createState() => _Api_Calling5State();
}

class _Api_Calling5State extends State<Api_Calling5> {

  List users= [];
  
  getuserData() async {
    try{
      var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      users = jsonDecode(res.body);
      setState(() {
        
      });
    }catch(e){
      debugPrint("Error = $e");
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Calling 5"),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              itemCount: users.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child: Column(
                  children: [
                    Text(users[index]["id"].toString()),
                    Text(users[index]["name"].toString()),
                    Text(users[index]["username"].toString()),
                    Text(users[index]["email"].toString()),
                    Text(users[index]["address"]["street"].toString()),
                    Text(users[index]["address"]["suite"].toString()),
                    Text(users[index]["address"]["city"].toString()),
                    Text(users[index]["address"]["zipcode"].toString()),
                    Text(users[index]["address"]["geo"]["lat"].toString()),
                    Text(users[index]["address"]["geo"]["lng"].toString()),
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
