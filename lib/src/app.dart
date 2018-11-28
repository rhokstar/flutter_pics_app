import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; // Only show GET
import './models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = []; // Create empty image list

  // Make HTTP request via async/await and iterate
  void fetchImage() async {
    counter++;
    var response = await get('http://jsonplaceholder.typicode.com/photos/$counter');

    // Parse the JSON object for the body from the named constructor
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    
    // Update the widget State
    setState(() {
      images.add(imageModel); // add images to ImageModel
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Doggo Images'),
        ),
      ),
    );
  }
}
