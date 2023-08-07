// To parse this JSON data, do
//
//     final ViewerModel = ViewerModelFromJson(jsonString);

import 'dart:convert';
import 'package:anywhere_code_exercise/models/meta_model.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';

ViewerModel viewerModelFromJson(String str) =>
    ViewerModel.fromJson(json.decode(str));

String viewerModelToJson(ViewerModel data) => json.encode(data.toJson());

class ViewerModel {
  String viewerModelAbstract;
  String abstractSource;
  String abstractText;
  String abstractUrl;
  String answer;
  String answerType;
  String definition;
  String definitionSource;
  String definitionUrl;
  String entity;
  String heading;
  String image;
  int imageHeight;
  int imageIsLogo;
  int imageWidth;
  String infobox;
  String redirect;
  List<RelatedTopic> relatedTopics;
  List<dynamic> results;
  String type;
  Meta meta;

  ViewerModel({
    required this.viewerModelAbstract,
    required this.abstractSource,
    required this.abstractText,
    required this.abstractUrl,
    required this.answer,
    required this.answerType,
    required this.definition,
    required this.definitionSource,
    required this.definitionUrl,
    required this.entity,
    required this.heading,
    required this.image,
    required this.imageHeight,
    required this.imageIsLogo,
    required this.imageWidth,
    required this.infobox,
    required this.redirect,
    required this.relatedTopics,
    required this.results,
    required this.type,
    required this.meta,
  });

  factory ViewerModel.fromJson(Map<String, dynamic> json) => ViewerModel(
        viewerModelAbstract: json["Abstract"],
        abstractSource: json["AbstractSource"],
        abstractText: json["AbstractText"],
        abstractUrl: json["AbstractURL"],
        answer: json["Answer"],
        answerType: json["AnswerType"],
        definition: json["Definition"],
        definitionSource: json["DefinitionSource"],
        definitionUrl: json["DefinitionURL"],
        entity: json["Entity"],
        heading: json["Heading"],
        image: json["Image"],
        imageHeight: json["ImageHeight"],
        imageIsLogo: json["ImageIsLogo"],
        imageWidth: json["ImageWidth"],
        infobox: json["Infobox"],
        redirect: json["Redirect"],
        relatedTopics: List<RelatedTopic>.from(
            json["RelatedTopics"].map((x) => RelatedTopic.fromJson(x))),
        results: List<dynamic>.from(json["Results"].map((x) => x)),
        type: json["Type"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "Abstract": viewerModelAbstract,
        "AbstractSource": abstractSource,
        "AbstractText": abstractText,
        "AbstractURL": abstractUrl,
        "Answer": answer,
        "AnswerType": answerType,
        "Definition": definition,
        "DefinitionSource": definitionSource,
        "DefinitionURL": definitionUrl,
        "Entity": entity,
        "Heading": heading,
        "Image": image,
        "ImageHeight": imageHeight,
        "ImageIsLogo": imageIsLogo,
        "ImageWidth": imageWidth,
        "Infobox": infobox,
        "Redirect": redirect,
        "RelatedTopics":
            List<dynamic>.from(relatedTopics.map((x) => x.toJson())),
        "Results": List<dynamic>.from(results.map((x) => x)),
        "Type": type,
        "meta": meta.toJson(),
      };
}
