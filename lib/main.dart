import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:produck/responsive/mobile_screen_layout.dart';
import 'package:produck/responsive/responsive_layout_screen.dart';
import 'package:produck/responsive/web_screen_layout.dart';
import 'package:produck/screens/login_screen.dart';
import 'package:produck/screens/signup_screen.dart';
import 'package:produck/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyB01vSlG2XiWcz7kFb8YSch30Iw4z4bNUU', 
        appId: '1:526045306852:web:8eec29b7acf1068bb531f1', 
        messagingSenderId: '526045306852', 
        projectId: 'produck-9a362',
        storageBucket: "produck-9a362.appspot.com")
    );
  }
  else {
    await Firebase.initializeApp();

  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produck',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
       home: SignupScreen(),
      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout() ,
      //   webScreenLayout: WebScreenLayout(),
      // ),
    );
  }
}

