import 'package:firestore_model/firestore_model.dart';

class Survey extends SubCollectionModel<Survey> {
  late String survey1;
  late String survey2;
  late String survey3;
  late String survey4;
  late String survey5;
  late String survey6;
  late String survey7;
  late String survey8;
  late String survey9;
  late String survey10;
  late String survey11;
  late String survey12;
  late String survey13;
  late String survey14;

  Survey({
    this.survey1 = '',
    this.survey2 = '',
    this.survey3 = '',
    this.survey4 = '',
    this.survey5 = '',
    this.survey6 = '',
    this.survey7 = '',
    this.survey8 = '',
    this.survey9 = '',
    this.survey10 = '',
    this.survey11 = '',
    this.survey12 = '',
    this.survey13 = '',
    this.survey14 = '',
  });

  @override
  Map<String, dynamic> get toMap => {
        "survey1": survey1,
        "survey2": survey2,
        "survey3": survey3,
        "survey4": survey4,
        "survey5": survey5,
        "survey6": survey6,
        "survey7": survey7,
        "survey8": survey8,
        "survey9": survey9,
        "survey10": survey10,
        "survey11": survey11,
        "survey12": survey12,
        "survey13": survey13,
        "survey14": survey14,
      };

  Survey.fromMap(Map<String, dynamic> map) {
    this.survey1 = map['survey1'] ?? '';
    this.survey2 = map['survey2'] ?? '';
    this.survey3 = map['survey3'] ?? '';
    this.survey4 = map['survey4'] ?? '';
    this.survey5 = map['survey5'] ?? '';
    this.survey6 = map['survey6'] ?? '';
    this.survey7 = map['survey7'] ?? '';
    this.survey8 = map['survey8'] ?? '';
    this.survey9 = map['survey9'] ?? '';
    this.survey10 = map['survey10'] ?? '';
    this.survey11 = map['survey11'] ?? '';
    this.survey12 = map['survey12'] ?? '';
    this.survey13 = map['survey13'] ?? '';
    this.survey14 = map['survey14'] ?? '';
  }

  @override
  ResponseBuilder<Survey> get responseBuilder => (map) => Survey.fromMap(map);
}
