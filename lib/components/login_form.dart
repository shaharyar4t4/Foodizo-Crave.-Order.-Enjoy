import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_services.dart';
import '../util/cont_color.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthServices authServices;
  final RxBool isSecure;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.authServices,
    required this.isSecure,
  });

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    //         child: TextField(
    //           controller: emailController,
    //           decoration: InputDecoration(
    //             hintText: "Email Address",
    //             hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
    //             fillColor: Colors.grey[50],
    //             filled: true,
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //                 borderSide: BorderSide.none),
    //             focusedBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: const BorderSide(
    //                 color: sttext,
    //                 width: 2.0,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       Obx(() => TextField(
    //         controller: passwordController,
    //         obscureText: isSecure.value,
    //         decoration: InputDecoration(
    //           hintText: "***** *****",
    //           hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
    //           fillColor: Colors.grey[50],
    //           filled: true,
    //           suffixIcon: InkWell(
    //             onTap: () => isSecure.value = !isSecure.value,
    //             child: Icon(
    //               isSecure.value
    //                   ? Icons.remove_red_eye_outlined
    //                   : Icons.remove_red_eye,
    //             ),
    //           ),
    //           border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: BorderSide.none),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             borderSide: const BorderSide(
    //               color: sttext,
    //               width: 2.0,
    //             ),
    //           ),
    //         ),
    //       )),
    //       const SizedBox(height: 15),
    //       const Padding(
    //         padding: EdgeInsets.only(left: 160),
    //         child: Text("Forgot Password?", style: TextStyle(color: sttext)),
    //       ),
    //       const SizedBox(height: 15),
    //       Container(
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             colors: [sttext, sbtn],
    //             begin: Alignment.topLeft,
    //             end: Alignment.bottomRight,
    //           ),
    //           borderRadius: BorderRadius.circular(13),
    //         ),
    //         child: ElevatedButton(
    //           onPressed: () async {
    //             String? result = await authServices.login(
    //                 emailController.text, passwordController.text);
    //             if (result == "success") {
    //               Get.offAllNamed("/NavBar");
    //               Get.snackbar("Success", "You are logged in now",
    //                   backgroundColor: sttext,
    //                   colorText: Colors.white,
    //                   snackPosition: SnackPosition.BOTTOM);
    //             } else {
    //               Get.snackbar("Login Failed", result ?? "Unknown error",
    //                   backgroundColor: Colors.red,
    //                   colorText: Colors.white,
    //                   snackPosition: SnackPosition.BOTTOM);
    //             }
    //           },
    //           style: ElevatedButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
    //             backgroundColor: Colors.transparent,
    //             shadowColor: Colors.transparent,
    //           ),
    //           child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
    //         ),
    //       ),
    //       const SizedBox(height: 20),
    //       Container(
    //         width: 250,
    //         height: 45,
    //         decoration: BoxDecoration(
    //           color: Colors.grey[20],
    //           borderRadius: BorderRadius.circular(13),
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image.asset("assets/images/google.png", width: 30, height: 30),
    //             const SizedBox(width: 10),
    //             const Text(" Login with Google", style: TextStyle(color: Colors.black, fontSize: 16)),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
}
