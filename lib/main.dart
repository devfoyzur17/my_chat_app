 

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/pages/chat_room_page.dart';
import 'package:my_chat_app/pages/launcher_page.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:my_chat_app/pages/profile_page.dart';
import 'package:my_chat_app/pages/sign_up_page.dart';
import 'package:my_chat_app/pages/user_list_page.dart';
import 'package:my_chat_app/providers/user_provider.dart';
import 'package:provider/provider.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider()),
    ],
    
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    Map<int, Color> pokeballRedSwatch = {
      50: Color.fromARGB(255, 24, 1, 105),
      100: Color.fromARGB(255, 255, 88, 88),
      200: Color.fromARGB(255, 255, 88, 88),
      300: Color.fromARGB(255, 255, 88, 88),
      400: Color.fromARGB(255, 255, 88, 88),
      500: Color.fromARGB(255, 255, 88, 88),
      600: Color.fromARGB(255, 255, 88, 88),
      700: Color.fromARGB(255, 255, 88, 88),
      800: Color.fromARGB(255, 255, 88, 88),
      900: Color.fromARGB(255, 252, 70, 70),
    };
    MaterialColor appColor = MaterialColor(0xff00802b, pokeballRedSwatch);
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: appColor,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName :(context) => const LauncherPage(),
        LoginPage.routeName :(context) => const LoginPage(),
        SignUpPage.routeName :(context) => const SignUpPage(),
        UserListPage.routeName :(context) => const UserListPage(),
        ProfilePage.routeName :(context) => const ProfilePage(),
        ChatRoomPage.routeName :(context) => const ChatRoomPage(),
      },
      
    );
  }
}
 