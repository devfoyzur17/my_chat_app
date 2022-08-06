import 'package:flutter/material.dart'; 
import 'package:my_chat_app/models/user_model.dart';

class SingleUser extends StatelessWidget {
  final UserModel user;
  const SingleUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Stack(children: [
        user.image == null ? Image.asset("assets/images/person.png",height: 50,width: 50,fit: BoxFit.cover,): Image.network(user.image!)
      ],),

      title: Text(user.name.toString()),
    );
    
  }
}