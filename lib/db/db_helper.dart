import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/models/user_model.dart';

class DBHelper{
  static const String collectionUser = "users";


  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel){
    final doc = _db.collection(collectionUser).doc();

    return doc.set(userModel.toMap());
  }

}