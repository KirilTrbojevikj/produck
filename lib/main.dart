import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:produck/providers/user_provider.dart';
import 'package:produck/responsive/mobile_screen_layout.dart';
import 'package:produck/responsive/responsive_layout_screen.dart';
import 'package:produck/responsive/web_screen_layout.dart';
import 'package:produck/screens/login_screen.dart';
import 'package:produck/screens/signup_screen.dart';
import 'package:produck/utils/colors.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Produck',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
         home: StreamBuilder(
           stream: FirebaseAuth.instance.authStateChanges(),
           builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData){

                 return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout() ,
                    webScreenLayout: WebScreenLayout(),
                 );
                } else if(snapshot.hasError){
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
           },
         ),
      ),
    );
  }
}

