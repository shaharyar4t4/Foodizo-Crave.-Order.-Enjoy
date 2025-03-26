import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_services.dart';
import '../util/cont_color.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailsig;
  final TextEditingController passsig;
  final AuthServices authServices;
  final RxBool isSecure;

  const RegisterForm({
    super.key,
    required this.emailsig,
    required this.passsig,
    required this.authServices,
    required this.isSecure,
  });

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
    //         child: TextField(
    //           decoration: InputDecoration(
    //             hintText: "Full Name",
    //             hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
    //             fillColor: Colors.grey[50],
    //             filled: true,
    //             border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //                 borderSide: BorderSide.none),
    //             focusedBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: const BorderSide(
    //                 color: sttext, // Border color when focused
    //                 width: 2.0,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       TextField(
    //         controller: emailsig,
    //         decoration: InputDecoration(
    //           hintText: "Email Address",
    //           hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
    //           fillColor: Colors.grey[50],
    //           filled: true,
    //           border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: BorderSide.none),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             borderSide: const BorderSide(color: sttext, width: 2.0),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       Obx(() => TextField(
    //         controller: passsig,
    //         obscureText: isSecure.value,
    //         decoration: InputDecoration(
    //           hintText: "***** *****",
    //           hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
    //           fillColor: Colors.grey[50],
    //           filled: true,
    //           suffixIcon: InkWell(
    //             onTap: () => isSecure.value = !isSecure.value,
    //             child: Icon(isSecure.value
    //                 ? Icons.remove_red_eye_outlined
    //                 : Icons.remove_red_eye),
    //           ),
    //           border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: BorderSide.none),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             borderSide: const BorderSide(color: sttext, width: 2.0),
    //           ),
    //         ),
    //       )),
    //       const SizedBox(height: 15),
    //       ElevatedButton(
    //         onPressed: () async {
    //           String? result = await authServices.register(
    //               emailsig.text, passsig.text);
    //           if (result == "success") {
    //             Get.snackbar("Success", "Account Created Successfully",
    //                 backgroundColor: Colors.green,
    //                 colorText: Colors.white,
    //                 snackPosition: SnackPosition.BOTTOM);
    //           } else {
    //             Get.snackbar("Sign Up Failed", result ?? "Unknown error",
    //                 backgroundColor: Colors.red, colorText: Colors.white);
    //           }
    //         },
    //         style: ElevatedButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
    //             backgroundColor: sttext,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(13),
    //             )),
    //         child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
    //       ),
    //       const SizedBox(height: 13),
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
    //       )
    //     ],
    //   ),
    // );
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
}
