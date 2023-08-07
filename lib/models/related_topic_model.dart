import 'package:anywhere_code_exercise/models/icon_model.dart';

class RelatedTopic {
  String firstUrl;
  Icon icon;
  String result;
  String text;
  String name;
  String description;

  RelatedTopic({
    required this.firstUrl,
    required this.icon,
    required this.result,
    required this.text,
    required this.name,
    required this.description,
  });

  factory RelatedTopic.fromJson(Map<String, dynamic> json) {
    List<String> splitText = json["Text"].split(" - ");
    return RelatedTopic(
        firstUrl: json["FirstURL"],
        icon: Icon.fromJson(json["Icon"]),
        result: json["Result"],
        text: json["Text"],
        name: splitText.first,
        description: splitText.last);
  }

  Map<String, dynamic> toJson() => {
        "FirstURL": firstUrl,
        "Icon": icon.toJson(),
        "Result": result,
        "Text": text,
        "name": name,
        "description": description
      };
}
