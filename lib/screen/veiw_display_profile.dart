import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopstore/screen/view_dashbored.dart';

import '../util/cont_color.dart';

class ProfileShow extends StatelessWidget {
  const ProfileShow({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Future<File?> _loadImage() async {
      final appDir = await getApplicationDocumentsDirectory();
      final imagePath = File('${appDir.path}/selected_image.jpg');
      if (await imagePath.exists()) {
        return imagePath;
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Center(
                child: FutureBuilder<File?>(
                  future: _loadImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(snapshot.data!),
                        backgroundColor: Colors.grey[200],
                      );
                    } else {
                      return CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.error, color: Colors.black),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 15.0, right: 24.0),
                child: Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [sttext, sbtn],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Text("Rs 10,034.00",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 12),
                                child: Text("Shaharyar Ali",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: Text("2210 3090 22** ****",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: const Icon(
                              Icons.wallet,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 26.0, top: 15.0),
                child: const Text("Profile Information",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: sttext,
                    )),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('profiles')
                      .doc(user!.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Center(child: Text("No Profile Found"));
                    }

                    var data = snapshot.data!.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Name \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${data['name']}",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          Text(
                              "Phone \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${data['phone']}",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          Text(
                              "Address \t\t\t\t\t\t\t\t\t\t\t\t${data['address']}",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [sttext, sbtn],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ElevatedButton(
                    onPressed: () => ViewDashbored(),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 17),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      "Back to Home",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
