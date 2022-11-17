import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_application/testhome.dart';
import 'package:path/path.dart';
import 'package:http/http.dart ' as http;

import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? fileImageCamera;
  File? fileImageGallery;
  ImagePicker imageinst = ImagePicker();
  Future upLoadImageFromCamera() async {
    var upLoadImageCamera =
        await imageinst.pickImage(source: ImageSource.camera);
    if (upLoadImageCamera != null) {
      fileImageCamera = File(upLoadImageCamera.path);
      String nameImageCamer = basename(upLoadImageCamera.path);
      int randInt = Random().nextInt(10000000);
      nameImageCamer = "$randInt$nameImageCamer";

      // Upload Image From Camera

      var sendImageToFireBase =
          FirebaseStorage.instance.ref("MyImage").child("$nameImageCamer");
      await sendImageToFireBase.putFile(fileImageCamera!);
      var url = await sendImageToFireBase.getDownloadURL();
      print("=====================");
      print(url);
      print("=====================");

      //End Upload Image from camera
    } else {
      print("=====================");
      print("chose image ");
      print("=====================");
    }
  }

  Future upLoadImageFromGallery() async {
    var upLoadImageGallery =
        await imageinst.pickImage(source: ImageSource.gallery);
    if (upLoadImageGallery != null) {
      fileImageCamera = File(upLoadImageGallery.path);
      String nameImageGallery = basename(upLoadImageGallery.path);
      int randInt = Random().nextInt(10000000);
      nameImageGallery = "$randInt$nameImageGallery";

      // Upload Image From CGallery

      var sendImageToFireBase =
          FirebaseStorage.instance.ref("MyImage").child("$nameImageGallery");
      await sendImageToFireBase.putFile(fileImageCamera!);
      var url = await sendImageToFireBase.getDownloadURL();
      print("=====================");
      print(url);
      print("=====================");

      //End Upload Image from Gallery
    } else {
      print("=====================");
      print("chose image ");
      print("=====================");
    }
  }

  Future upLoadVideoFromGallery() async {
    var upLoadVideoGallery =
        await imageinst.pickVideo(source: ImageSource.camera);
    if (upLoadVideoGallery != null) {
      fileImageCamera = File(upLoadVideoGallery.path);
      String namevideoGallery = basename(upLoadVideoGallery.path);
      int randInt = Random().nextInt(10000000);
      namevideoGallery = "$randInt$namevideoGallery";

      // Upload Image From Camera

      var sendImageToFireBase =
          FirebaseStorage.instance.ref("MyImage").child("$namevideoGallery");
      await sendImageToFireBase.putFile(fileImageCamera!);
      var url = await sendImageToFireBase.getDownloadURL();
      print("=====================");
      print(url);
      print("=====================");

      //End Upload Image from camera
    } else {
      print("=====================");
      print("chose image ");
      print("=====================");
    }
  }

  // get name images and folders from firebasestorage
  Future getNamesImagesAndFolders() async {
    var refrance =
        await FirebaseStorage.instance.ref().list(ListOptions(maxResults: 2));
    refrance.prefixes.forEach((element) {
      print("===============================");
      print(element.name);
    });
  }

  // end get

  Future getToken() async {
    var firemessrefr = FirebaseMessaging.instance.getToken().then((value) {
      print("++++++++++++++++++++++++++");
      print(value);
      print("+++++++++++++++++++++++");
    });
  }

  // send notification
  String serverToken = "a81ee77b80a78d3e1514306f273af8e8d9265dff";

  @override
  Widget build(BuildContext context) {
    Future sendMessabeApi() async {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'this is a body',
              'title': 'this is a title'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': await FirebaseMessaging.instance.getToken(),
          },
        ),
      );
    }

    getMessage() {
      FirebaseMessaging.onMessage.listen((event) {
        print("+++++++++++++++++++++++++++++++++++++++++++");
        print(event.notification!.body);
        print(event.notification!.title);
      });
    }

    @override
    void initState() {
      getMessage();
      super.initState();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("test"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await upLoadImageFromCamera();
                    },
                    child: Text("Load image from camera")),
                ElevatedButton(
                    onPressed: () async {
                      await upLoadImageFromGallery();
                    },
                    child: Text("Load image from gelary")),
                ElevatedButton(
                    onPressed: () {
                      sendMessabeApi();
                    },
                    child: Text("Load Video from Camera")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
