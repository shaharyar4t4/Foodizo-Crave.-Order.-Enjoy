import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopstore/components/nav_bar.dart';
import 'package:shopstore/firebase_options.dart';
import 'package:shopstore/routes/app_routes.dart';
import 'package:shopstore/screen/veiw_thanks.dart';
import 'package:shopstore/screen/view_dashbored.dart';
import 'package:shopstore/screen/view_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      getPages: allPage,
      home: ViewSplash(),
    );
  }
}
