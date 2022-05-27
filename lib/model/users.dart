import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';

class UserModel extends FirestoreModel<UserModel> {
  late String email;
  late String imageUrl;
  late String uId;
  late String numPhone;
  late String displayName;
  late String userName;
  late String password;
  late String age;
  late String gender;
  late String date;
  late String time;
  late String lunch;
  late String cal;
  late String carbs;
  late String activityType;
  late String duration;
  late String glucose;
  late String shortAction;
  late String longAction;

  UserModel({
    this.displayName = '',
    this.imageUrl = '',
    this.uId = '',
    this.email = '',
    this.numPhone = '',
    this.password = '',
    this.userName = '',
    this.age = '',
    this.gender = '',
    this.time = '',
    this.date = '',
    this.activityType = '',
    this.duration = '',
    this.glucose = '',
    this.longAction = '',
    this.lunch = '',
    this.cal = '',
    this.carbs = '',
    this.shortAction = '',
  });

  UserModel.fromAuth(User userAuth) {
    this.email = userAuth.email ?? '';
    this.numPhone = userAuth.phoneNumber ?? '';
    this.displayName = userAuth.displayName ?? '';
    // this.userName = userAuth.email?.split('@').first.trim() ?? '';
  }

  @override
  Map<String, dynamic> get toMap => {
        "displayName": displayName,
        "imageUrl": imageUrl,
        "uId": uId,
        "userName": email.split('@').first.trim(),
        'email': email,
        "numPhone": numPhone,
        "age": age,
        "gender": gender,
        "time": time,
        "date": date,
        "activityType": activityType,
        "duration": duration,
        "glucose": glucose,
        "longAction": longAction,
        "lunch": lunch,
        "cal": cal,
        "carbs": carbs,
        "shortAction": shortAction,
      };

  UserModel.fromMap(Map<String, dynamic> map) {
    this.numPhone = map['numPhone'] ?? '';
    this.displayName = map['displayName'] ?? '';
    this.imageUrl = map['imageUrl'] ?? '';
    this.uId = map['uId'] ?? '';
    this.userName = map['userName'] ?? '';
    this.email = map['email'] ?? '';
    this.gender = map['gender'] ?? '';
    this.age = map['age'] ?? '';
    this.time = map['time'] ?? '';
    this.date = map['date'] ?? '';
    this.activityType = map['activityType'] ?? '';
    this.duration = map['duration'] ?? '';
    this.glucose = map['glucose'] ?? '';
    this.longAction = map['longAction'] ?? '';
    this.lunch = map['lunch'] ?? '';
    this.cal = map['cal'] ?? '';
    this.carbs = map['carbs'] ?? '';
    this.shortAction = map['shortAction'] ?? '';
  }

  @override
  ResponseBuilder<UserModel> get responseBuilder =>
      (map) => UserModel.fromMap(map);

  @override
  String get collectionName => 'users';
}
