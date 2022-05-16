import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';

class Doctor extends FirestoreModel<Doctor> {
  late String email;
  late String password;
  late String uId;
  late String numPhone;
  late String displayName;
  late String adress;
  late String spiciality;
  late String degree;
  late String location;
  late String booking;

  Doctor({
    this.displayName = '',
    this.uId = '',
    this.email = '',
    this.numPhone = '',
    this.password = '',
    this.adress = '',
    this.spiciality = '',
    this.degree = '',
    this.location = '',
    this.booking = '',
  });

  Doctor.fromAuth(User userAuth) {
    this.email = userAuth.email ?? '';
    this.numPhone = userAuth.phoneNumber ?? '';
    this.displayName = userAuth.displayName ?? '';
    // this.userName = userAuth.email?.split('@').first.trim() ?? '';
  }

  @override
  Map<String, dynamic> get toMap => {
        "displayName": displayName,
        "password": password,
        "uId": uId,
        "userName": email.split('@').first.trim() ?? '',
        'email': email,
        "numPhone": numPhone,
        "adress": adress,
        "spiciality": spiciality,
        "degree": degree,
        "location": location,
        "booking": booking,
      };

  Doctor.fromMap(Map<String, dynamic> map) {
    this.numPhone = map['numPhone'] ?? '';
    this.password = map['password'] ?? '';
    this.displayName = map['displayName'] ?? '';
    this.uId = map['uId'] ?? '';

    this.email = map['email'] ?? '';
    this.adress = map['adress'] ?? '';
    this.spiciality = map['spiciality'] ?? '';
    this.degree = map['degree'] ?? '';
    this.location = map['location'] ?? '';
    this.booking = map['booking'] ?? '';
  }

  @override
  ResponseBuilder<Doctor> get responseBuilder => (map) => Doctor.fromMap(map);
}
