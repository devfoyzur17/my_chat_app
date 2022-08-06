import 'package:flutter/material.dart';
import 'package:my_chat_app/auth/auth_service.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:my_chat_app/pages/user_list_page.dart'; 

class LauncherPage extends StatefulWidget {
  static const routeName ="/";
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    
    Future.delayed(Duration.zero,(){
      if(AuthService.user == null){
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, UserListPage.routeName);
      }
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const CircularProgressIndicator(),
    );
  }
}