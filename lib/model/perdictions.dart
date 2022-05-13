import 'package:firestore_model/firestore_model.dart';

class Prediction extends SubCollectionModel<Prediction> {
  late String date;
  late String time;
  late String lunch;
  late String meal;
  late String activityType;
  late String duration;
  late String glucose;
  late String cal;
  late String carbs;
  late String shortAction;
  late String longAction;

  Prediction({
    this.time = '',
    this.date = '',
    this.activityType = '',
    this.duration = '',
    this.glucose = '',
    this.longAction = '',
    this.lunch = '',
    this.meal = '',
    this.shortAction = '',
    this.cal = '',
    this.carbs = '',
  });

  @override
  Map<String, dynamic> get toMap => {
        "time": time,
        "date": date,
        "activityType": activityType,
        "duration": duration,
        "glucose": glucose,
        "longAction": longAction,
        "lunch": lunch,
        "meal": meal,
        "shortAction": shortAction,
        "cal": cal,
        "carbs": carbs,
      };

  Prediction.fromMap(Map<String, dynamic> map) {
    this.time = map['time'] ?? '';
    this.date = map['date'] ?? '';
    this.activityType = map['activityType'] ?? '';
    this.duration = map['duration'] ?? '';
    this.glucose = map['glucose'] ?? '';
    this.longAction = map['longAction'] ?? '';
    this.lunch = map['lunch'] ?? '';
    this.meal = map['meal'] ?? '';
    this.shortAction = map['shortAction'] ?? '';
    this.cal = map['cal'] ?? '';
    this.carbs = map['carbs'] ?? '';
  }

  @override
  ResponseBuilder<Prediction> get responseBuilder =>
      (map) => Prediction.fromMap(map);
}
