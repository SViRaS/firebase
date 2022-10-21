import 'package:firebase_app/helper/helper_function.dart';
import 'package:firebase_app/pages/auth/login_page.dart';
import 'package:firebase_app/pages/home_page.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: Constants.apiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    
    super.initState();
    getUserLoggedInStatus();
  }

getUserLoggedInStatus() async {
  await HelperFunctuions.getUserLoggedInStatus().then((value) {
    if(value!=null ) {
     _isSignedIn = value;
    }
  });
}
 



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomeScreen() : const LoginPage(),
    );
  }
}

