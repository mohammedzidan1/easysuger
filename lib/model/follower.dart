import 'package:firestore_model/firestore_model.dart';

class Follower extends SubCollectionModel<Follower> {
  late String type;
  late String name;
  late String phoneNum;
  late String patientCode;

  Follower({
    this.type = '',
    this.name = '',
    this.patientCode = '',
    this.phoneNum = '',
  });

  @override
  Map<String, dynamic> get toMap => {
        'type': type,
        'name': name,
        'patientCode': patientCode,
        'phoneNum': phoneNum,
      };

  Follower.fromMap(Map<String, dynamic> map) {
    type = map['type'] ?? '';
    name = map['name'] ?? '';
    patientCode = map['patientCode'] ?? '';
    phoneNum = map['phoneNum'] ?? '';
  }

  @override
  ResponseBuilder<Follower> get responseBuilder =>
      (map) => Follower.fromMap(map);
}
