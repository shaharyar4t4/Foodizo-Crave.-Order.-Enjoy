import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopstore/util/cont_color.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final picker = ImagePicker();
  // Future getImageGallery() async {
  //   final pickedfile =
  //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
  //   setState(() {
  //     if (pickedfile != null) {
  //       _image = File(pickedfile.path);
  //     } else {
  //       print("No image is picked");
  //     }
  //   });
  // }
  Future getImageGallery() async {
    final pickedfile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedfile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final savedImage =
          await File(pickedfile.path).copy('${appDir.path}/selected_image.jpg');
      setState(() {
        _image = savedImage;
      });
    } else {
      print("No image is picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: Image.asset("assets/images/pattern.png").image,
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xAEFFD7D7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: sttext),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 15.0),
              child: const Text("Profile",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: getImageGallery,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(Icons.browse_gallery,
                          size: 24, color: Colors.black)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: nameController, // Fix: Assign Controller
                decoration: InputDecoration(
                  hintText: "Enter your Full name",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: sttext, // Border color when focused
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: phoneController, // Fix: Assign Controller
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: sttext, // Border color when focused
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                maxLines: 4,
                controller: addressController, // Fix: Assign Controller
                decoration: InputDecoration(
                  hintText: "Mention your Current address",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: sttext, // Border color when focused
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    await FirebaseFirestore.instance
                        .collection('profiles')
                        .doc(user.uid)
                        .set({
                      'name': nameController.text.trim(),
                      'phone': phoneController.text.trim(),
                      'address': addressController.text.trim(),
                    });
                    Get.toNamed('/displayprofile');
                    Get.snackbar("Success", "Profile Saved");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  backgroundColor: sttext,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
