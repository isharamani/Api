import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignApi extends StatefulWidget {
  const SignApi({super.key});

  @override
  State<SignApi> createState() => _SignApiState();
}

class _SignApiState extends State<SignApi> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  void login(String email, password) async {
    try {
     var res = await http.post(Uri.parse("https://reqres.in/api/register"),
     body: jsonEncode({"email":emailcontroller.text.toString()}));


    } catch (e) {
      debugPrint("error=$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign APi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: "PassWord",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                login(emailcontroller.text.toString(), passwordcontroller.text.toString()
                    );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Sign Up"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Post {}
