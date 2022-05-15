import 'package:firestore_model/firestore_model.dart';

class Report extends SubCollectionModel<Report> {
  late String date;
  late String uId;
  late String time;
  late String shortAction;
  late String longAction;
  late String fasting;
  late String reminder;
  late String pills;

  Report({
    this.time = '',
    this.uId = '',
    this.date = '',
    this.fasting = '',
    this.longAction = '',
    this.pills = '',
    this.reminder = '',
    this.shortAction = '',
  });

  @override
  Map<String, dynamic> get toMap => {
        'time': time,
        'uId': uId,
        'date': date,
        'fasting': fasting,
        'longAction': longAction,
        'pills': pills,
        'reminder': reminder,
        'shortAction': shortAction,
      };

  Report.fromMap(Map<String, dynamic> map) {
    time = map['time'] ?? '';
    uId = map['uId'] ?? '';
    date = map['date'] ?? '';
    fasting = map['fasting'] ?? '';
    longAction = map['longAction'] ?? '';
    pills = map['pills'] ?? '';
    reminder = map['reminder'] ?? '';
    shortAction = map['shortAction'] ?? '';
  }

  @override
  ResponseBuilder<Report> get responseBuilder => (map) => Report.fromMap(map);
}
