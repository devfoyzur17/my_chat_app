import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/auth/auth_service.dart';
import 'package:my_chat_app/models/user_model.dart';

class DBHelper {
  static const String collectionUser = "users";

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(collectionUser).doc(AuthService.user!.uid);

    return doc.set(userModel.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() => _db
      .collection(collectionUser)
      .orderBy(userUid, descending: true)
      .snapshots();

 static Future<void> updateAvailable(String uid, bool isAvailable) async {
   
    _db.collection(collectionUser).doc(uid).update({userAvailable: isAvailable});
  }
    
}
