import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/components/login_form.dart';
import 'package:shopstore/components/register_form.dart';
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
                      RegisterForm(
                        emailsig: emailsig,
                        passsig: passsig,
                        authServices: authServices,
                        isSecure: isSecure,
                      ),
                      LoginForm(
                        emailController: emailController,
                        passwordController: passwordController,
                        authServices: authServices,
                        isSecure: isSecure,
                      ),
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
