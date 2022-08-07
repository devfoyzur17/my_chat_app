import 'package:flutter/cupertino.dart';
import 'package:my_chat_app/db/db_helper.dart';
import 'package:my_chat_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> allUserList = [];

  Future<void> addUser(UserModel userModel) => DBHelper.addUser(userModel);

  getAllUser() {
    DBHelper.getAllUsers().listen((snapshot) {
      allUserList = List.generate(snapshot.docs.length,
          (index) => UserModel.fromMap(snapshot.docs[index].data()));
          notifyListeners();
    });
  }

  Future<void> updateAvailable(String uid, bool isAvailable)=> DBHelper.updateAvailable(uid, isAvailable);

}
