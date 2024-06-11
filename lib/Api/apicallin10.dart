import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomDogImage extends StatefulWidget {
  @override
  _RandomDogImageState createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  late String _imageUrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRandomDogImage();
  }

  Future<void> _fetchRandomDogImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _imageUrl = data['message'];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load dog image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dog Image'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _imageUrl != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(_imageUrl),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _fetchRandomDogImage,
                        child: Text('Load Another'),
                      ),
                    ],
                  )
                : Text('Failed to load image'),
      ),
    );
  }
}
