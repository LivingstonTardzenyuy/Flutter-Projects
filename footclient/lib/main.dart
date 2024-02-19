import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footclient/controller/home_controller.dart';
import 'package:footclient/controller/login_controller.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
// import 'package:ecommerce/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async {
  await GetStorage.init(); // helps to log in a user that already registed in the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoginController());
  Get.put(HomeController());
  // await Firebase.ini
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

