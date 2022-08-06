
import 'package:flutter/cupertino.dart';
import 'package:my_chat_app/db/db_helper.dart';
import 'package:my_chat_app/models/user_model.dart';

class UserProvider extends ChangeNotifier{

Future<void> addUser(UserModel userModel)=> DBHelper.addUser(userModel);

}