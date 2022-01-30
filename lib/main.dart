import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/screens/authentication/login_screen.dart';
import 'package:get/get.dart';
import 'package:ilearn/screens/dashboard/homepage.dart';
import 'package:ilearn/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      initialData: UserModel(uid: ''),
      value: AuthServices().user,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'SourceSansPro',
        ),
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);

    return user.uid != '' ? HomePage() : LoginScreen();
  }
}
