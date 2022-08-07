// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_chat_app/models/user_model.dart';

class SingleUser extends StatelessWidget {
  final UserModel user;
  const SingleUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          
          contentPadding: EdgeInsets.all(5),
          leading: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              user.image == null
                  ? Image.asset(
                      "assets/images/person.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.image!,  height: 50,
                      width: 50,
                      fit: BoxFit.cover,),
                  ),


                  user.available? Positioned(
                    bottom: 3,
                    right: -1,
                    child: Icon(Icons.circle,size: 18,color: Colors.green,)):SizedBox(),
            ],
          ),
          title: Text(user.name.toString()),
        ),
        Divider(height: 2,)
      ],
    );
  }
}
