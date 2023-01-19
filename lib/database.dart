import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference UserData =
      FirebaseFirestore.instance.collection('users data');

  Future updateUserData(
      String email,
      String username,
      String password,
      String confirmpassword,
      String phonenumber,
      String gender,
      String dateofbirth,
      String cholestrollevel,
      String bloodpressaure,
      String bloodsugar) async {
    return await UserData.doc(uid).set({
      'email': email,
      'username': username,
      'password': password,
      'confirmed password': confirmpassword,
      'phonenumber': phonenumber,
      'gender': gender,
      'date of birth': dateofbirth,
      'cholesterol level': cholestrollevel,
      'blood pressure': bloodpressaure,
      'blood sugar': bloodsugar,
    });
  }
}
