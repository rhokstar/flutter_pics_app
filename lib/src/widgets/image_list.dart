import 'package:flutter/material.dart';
import '../models/image_model.dart';

// ImageList Constructor
class ImageList extends StatelessWidget {
  // Declare instance variable "images" as a List and make immutable using keyword 'final' which doesn't maintain State.
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context) {
    return ListView.builder(
      itemCount: images.length, // How many images ListView will create
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(
          20.0), // You have to use a Double i.e. 20 vs 20.0 which
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(image.title),
        ],
      ), //Receive Image from network,
    );
  }
}
