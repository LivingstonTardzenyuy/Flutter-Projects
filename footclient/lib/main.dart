import 'package:flutter/material.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:ecommerce/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const RegisterPage(),
    );
  }
}

