import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_Calling8 extends StatefulWidget {
  const Api_Calling8({super.key});

  @override
  State<Api_Calling8> createState() => _Api_Calling8State();
}

class _Api_Calling8State extends State<Api_Calling8> {

  var namecontroller = TextEditingController();
  var positioncontroller = TextEditingController();
  var AllVariable = [];


  PostData() async {
    try{
      var res = await http.post(Uri.parse("https://web-production-09Of.up.railway.app/api/v1/jobs"),
      body: ({"company":namecontroller.text.toString(),
      "position":positioncontroller.text.toString()}));

    }
    catch(e){
      return "error";
     // Fluttertoast.showToast(msg: "error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Calling 8"),),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
