import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/auth/auth_service.dart';
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
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

    @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
 
    super.initState();
  }
  @override
  void didChangeDependencies() {
 
    if (AuthService.user != null) {
     
      Provider.of<UserProvider>(context, listen: false)
          .updateAvailable(AuthService.user!.uid, true);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() { 
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
 

    switch(state){

      case AppLifecycleState.paused:
        if(AuthService.user != null){

          Provider.of<UserProvider>(context,listen: false).updateAvailable(AuthService.user!.uid, false);
        }
        break;
      case AppLifecycleState.resumed:
        if(AuthService.user != null){

          Provider.of<UserProvider>(context,listen: false).updateAvailable(AuthService.user!.uid, true);
        }
        break;


      case AppLifecycleState.inactive:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
    } 
    super.didChangeAppLifecycleState(state);
  }


  @override
  Widget build(BuildContext context) {
    Map<int, Color> pokeballRedSwatch = {
      50: Color.fromARGB(255, 24, 1, 105),
      100: Color.fromARGB(255, 6, 150, 59),
      200: Color.fromARGB(255, 6, 150, 59),
      300: Color.fromARGB(255, 6, 150, 59),
      400: Color.fromARGB(255, 6, 150, 59),
      500: Color.fromARGB(255, 6, 150, 59),
      600: Color.fromARGB(255, 6, 150, 59),
      700: Color.fromARGB(255, 6, 150, 59),
      800: Color.fromARGB(255, 6, 150, 59),
      900: Color.fromARGB(255, 6, 150, 59),
    };
    MaterialColor appColor = MaterialColor(0xff0f0f57, pokeballRedSwatch);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (context) => const LauncherPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        UserListPage.routeName: (context) => const UserListPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        ChatRoomPage.routeName: (context) => const ChatRoomPage(),
      },
    );
  }
}
