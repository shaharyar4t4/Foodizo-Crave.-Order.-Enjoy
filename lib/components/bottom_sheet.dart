import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/services/auth_services.dart';
import '../util/cont_color.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailsig = TextEditingController();
TextEditingController passsig = TextEditingController();
AuthServices authServices = AuthServices();
final RxBool isSecure = true.obs;

void bottomSheet() {
  Get.bottomSheet(
    Scaffold(
      resizeToAvoidBottomInset:
          false, // Allows UI to adjust when keyboard appears
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        // Fix overflow issue
        child: Container(
          width: double.infinity,
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
                Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 15),
                TabBar(
                  labelColor: sttext ?? Colors.black,
                  indicatorColor: sttext,
                  dividerColor: Colors.transparent,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  tabs: [
                    Tab(text: "Create Account"),
                    Tab(text: "Login"),
                  ],
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: sttext, width: 2.0),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 400, // Adjust height to prevent overflow
                  child: TabBarView(
                    children: [
                      buildRegisterForm(),
                      buildLoginForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          child: TextField(
            controller: emailController, // Fix: Assign Controller
            decoration: InputDecoration(
              hintText: "Email Address",
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
        SizedBox(height: 15),
        Obx(()=>TextField(
          controller: passwordController,
          obscureText: isSecure.value,
          decoration: InputDecoration(
            hintText: "***** *****",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            fillColor: Colors.grey[50],
            filled: true,
            suffixIcon: InkWell(
              onTap: () {
                isSecure.value = !isSecure.value;
              },
              child: Icon(
                isSecure.value
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
              ),
            ),
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
        ),),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 160),
          child: const Text(
            "Forgot Password?",
            style: TextStyle(color: sttext),
          ),
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
            onPressed: () async {
              String? result = await authServices.login(
                  emailController.text, passwordController.text);
              if (result == "success") {
                Get.offAllNamed("/NavBar");
                Get.snackbar("success", "Your are login now..",
                    backgroundColor: sttext,
                    colorText: Colors.white,
                    snackPosition: SnackPosition
                        .BOTTOM); // Navigate only if login is successful
              } else {
                Get.snackbar("Login Failed", result ?? "Unknown error",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 250,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[20],
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google.png",
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                " Login with Google",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        )
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
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Full Name",
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
        SizedBox(height: 15),
        TextField(
          controller: emailsig, // Fix: Assign Controller
          decoration: InputDecoration(
            hintText: "Email Address",
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
        SizedBox(height: 15),
        Obx(()=>TextField(
          controller: passsig,
          decoration: InputDecoration(
            hintText: "***** *****",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            fillColor: Colors.grey[50],
            suffixIcon: InkWell(
              onTap: () {
                isSecure.value = !isSecure.value;
              },
              child: Icon(
                isSecure.value
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
              ),
            ),
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
          obscureText: isSecure.value,
        ),),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            String? result =
                await authServices.register(emailsig.text, passsig.text);
            if (result == "success") {
              Get.snackbar("Success", "Account Created Successfully",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              Get.snackbar("Sign Up Failed", result ?? "Unknown error",
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
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
          height: 13,
        ),
        Container(
          width: 250,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[20],
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google.png",
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                " Login with Google",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
