import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/screens/authentication/login_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'SourceSansPro',
      ),
      home: LoginScreen(),
    );
  }
}
