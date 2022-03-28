import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ImageGet(),
    );
  }
}

class ImageGet extends StatefulWidget {
  const ImageGet({Key? key}) : super(key: key);

  @override
  _ImageGetState createState() => _ImageGetState();
}

class _ImageGetState extends State<ImageGet> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? image_get;
  XFile? image_take;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: () async{
                XFile? getimage=await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  image_take=getimage;
                });
              }, icon: Icon(Icons.camera)),
              // IconButton(onPressed: () async{
              //   final List<XFile>? images = await _picker.pickMultiImage();
              //     setState(() {
              //       image_get=images;
              //     });
              // }, icon: Icon(Icons.photo)),

        //   if(image_get != null)   Image.file(File(image_get![0].path)),


              if(image_take != null)   Image.file(File(image_take!.path)),


            ],
          ),
        ),
      ),
    );
  }
}
