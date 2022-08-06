import 'package:flutter/material.dart';
import 'package:my_chat_app/widgets/main_drawer.dart'; 

class UserListPage extends StatefulWidget {
  static const routeName ="user-list-page";
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
    );
    
    
  }
}