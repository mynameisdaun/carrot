import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jdu_carrot/constants/data_keys.dart';

import '../utils/logger.dart';

class UserService {
  
  static final UserService _userService = UserService._internal();
  factory UserService() => _userService;
  UserService._internal();
  
  Future createNewUser(Map<String, dynamic> json, String userKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
              FirebaseFirestore.instance.collection(COL_USERS).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> documentSnapShot =
      await documentReference.get();

    if(!documentSnapShot.exists) {
      await documentReference.set(json);
    }
    
  }
  
  
  Future fireStoreTest() async {
    FirebaseFirestore.instance.collection('TESTING_COLLECTION').add({'testing':'hihi'});
  }

  void firestoreReadTest() async {
    await FirebaseFirestore.instance
        .collection('TESTING_COLLECTION')
        .doc('6WxS9sCIDa1RjwOFpl6U')
        .get().then((DocumentSnapshot<Map<String, dynamic>> value) => logger.d(value.data()));
  }
  
}