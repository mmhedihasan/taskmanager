import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/task/homeScreen.dart';
import 'package:taskmanager/utility/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp(const MyApp('/login'));
  }else{
    runApp(const MyApp('/'));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;
   const MyApp(this.firstRoute, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: firstRoute ,
      routes: {
        '/' : (context)=>const homeScreen(),
        '/login' : (context)=>loginScreen(),
        '/registration' : (context)=>registrationScreen(),
        '/pinVerification' : (context)=>pinVerificationScreen(),
        '/emailVerification' : (context)=>emailVerificationScreen(),
        '/setPassword' : (context)=>setPasswordScreen(),

      },
      );


  }
}

