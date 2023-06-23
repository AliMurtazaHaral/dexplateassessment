import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? name;
  String? url;
  String? password;
  final String? displayName;
  final int? age;
  UserModel({this.uid, this.email, this.password, this.displayName, this.age,this.isVerified,this.name,this.url});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'age': age,
    };
  }
  Map<String, dynamic> toSaveInLocal() {
    return {
      'name': name,
      'url': url,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        age = doc.data()!["age"],
        displayName = doc.data()!["displayName"];
 

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? name,
    String? url,
    String? displayName,
    int? age,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
      age: age ?? this.age,
        name: name ?? this.name,
        url: url ?? this.url,
      isVerified: isVerified ?? this.isVerified
    );
  }
}


