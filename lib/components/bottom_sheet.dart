import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/services/auth_services.dart';
import '../util/cont_color.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailsig = TextEditingController();
TextEditingController passsig = TextEditingController();
AuthServices authServices = AuthServices();

void bottomSheet() {
  Get.bottomSheet(
    Container(
      width: double.infinity,
      height: 800,
      // Increased height for better UI
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Container(
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 15),
            // TabBar (Login & Register)
            TabBar(
              labelColor: (sttext != null) ? sttext : Colors.black,
              indicatorColor: sttext,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              tabs: [
                Tab(text: "Create Account"),
                Tab(
                  text: "Login",
                ),
              ],
            ),
            SizedBox(height: 15),
            // TabBar Views
            Expanded(
              child: TabBarView(
                children: [
                  // Register Form
                  buildRegisterForm(),
                  // Login Form
                  buildLoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Login Form Widget
Widget buildLoginForm() {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: sttext))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: sttext))),
          obscureText: true,
        ),
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [sttext, sbtn],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed("/NavBar");
              // String? result =   await authServices.login(
              //     emailController.text, passwordController.text);
              // if(result == "success"){
              //
              // }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

// Register Form Widget
Widget buildRegisterForm() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: "Full Name",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade100))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: emailsig,
          decoration: InputDecoration(
              labelText: "Email address",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade100))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: passsig,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade100)),
          ),
          obscureText: true,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () async {
            String? result =
                await authServices.register(emailsig.text, passsig.text);
            if (result == "success") {
              print("User are added");
            } else {
              CircularProgressIndicator();
            }
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              backgroundColor: sttext,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              )),
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: OutlinedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google.png',
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sigup with Google",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide.none,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        )
      ],
    ),
  );
}
