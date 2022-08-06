// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_chat_app/providers/user_provider.dart';
import 'package:my_chat_app/widgets/main_drawer.dart';
import 'package:my_chat_app/widgets/single_user.dart';
import 'package:provider/provider.dart'; 

class UserListPage extends StatefulWidget {
  static const routeName ="user-list-page";
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  bool isInit =true;
  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<UserProvider>(context,listen: false).getAllUser();
      isInit=false;
    }
    

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      
      body: Consumer<UserProvider>(
        builder: (context, provider, _) => 
          ListView.builder(
            itemCount: provider.allUserList.length,
          itemBuilder: (context, index){
            final user = provider.allUserList[index];
           return SingleUser(user: user,

           );
          })),
    );
    
    
  }
}