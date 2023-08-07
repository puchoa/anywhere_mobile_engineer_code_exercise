import 'package:anywhere_code_exercise/models/developer_model.dart';
import 'package:anywhere_code_exercise/models/maintainer_model.dart';
import 'package:anywhere_code_exercise/models/src_options_model.dart';

class Meta {
  dynamic attribution;
  dynamic blockgroup;
  dynamic createdDate;
  String description;
  dynamic designer;
  dynamic devDate;
  String devMilestone;
  List<Developer> developer;
  String exampleQuery;
  String id;
  dynamic isStackexchange;
  String jsCallbackName;
  dynamic liveDate;
  Maintainer maintainer;
  String name;
  String perlModule;
  dynamic producer;
  String productionState;
  String repo;
  String signalFrom;
  String srcDomain;
  int srcId;
  String srcName;
  SrcOptions srcOptions;
  dynamic srcUrl;
  String status;
  String tab;
  List<String> topic;
  int unsafe;

  Meta({
    this.attribution,
    this.blockgroup,
    this.createdDate,
    required this.description,
    this.designer,
    this.devDate,
    required this.devMilestone,
    required this.developer,
    required this.exampleQuery,
    required this.id,
    this.isStackexchange,
    required this.jsCallbackName,
    this.liveDate,
    required this.maintainer,
    required this.name,
    required this.perlModule,
    this.producer,
    required this.productionState,
    required this.repo,
    required this.signalFrom,
    required this.srcDomain,
    required this.srcId,
    required this.srcName,
    required this.srcOptions,
    this.srcUrl,
    required this.status,
    required this.tab,
    required this.topic,
    required this.unsafe,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        attribution: json["attribution"],
        blockgroup: json["blockgroup"],
        createdDate: json["created_date"],
        description: json["description"],
        designer: json["designer"],
        devDate: json["dev_date"],
        devMilestone: json["dev_milestone"],
        developer: List<Developer>.from(
            json["developer"].map((x) => Developer.fromJson(x))),
        exampleQuery: json["example_query"],
        id: json["id"],
        isStackexchange: json["is_stackexchange"],
        jsCallbackName: json["js_callback_name"],
        liveDate: json["live_date"],
        maintainer: Maintainer.fromJson(json["maintainer"]),
        name: json["name"],
        perlModule: json["perl_module"],
        producer: json["producer"],
        productionState: json["production_state"],
        repo: json["repo"],
        signalFrom: json["signal_from"],
        srcDomain: json["src_domain"],
        srcId: json["src_id"],
        srcName: json["src_name"],
        srcOptions: SrcOptions.fromJson(json["src_options"]),
        srcUrl: json["src_url"],
        status: json["status"],
        tab: json["tab"],
        topic: List<String>.from(json["topic"].map((x) => x)),
        unsafe: json["unsafe"],
      );

  Map<String, dynamic> toJson() => {
        "attribution": attribution,
        "blockgroup": blockgroup,
        "created_date": createdDate,
        "description": description,
        "designer": designer,
        "dev_date": devDate,
        "dev_milestone": devMilestone,
        "developer": List<dynamic>.from(developer.map((x) => x.toJson())),
        "example_query": exampleQuery,
        "id": id,
        "is_stackexchange": isStackexchange,
        "js_callback_name": jsCallbackName,
        "live_date": liveDate,
        "maintainer": maintainer.toJson(),
        "name": name,
        "perl_module": perlModule,
        "producer": producer,
        "production_state": productionState,
        "repo": repo,
        "signal_from": signalFrom,
        "src_domain": srcDomain,
        "src_id": srcId,
        "src_name": srcName,
        "src_options": srcOptions.toJson(),
        "src_url": srcUrl,
        "status": status,
        "tab": tab,
        "topic": List<dynamic>.from(topic.map((x) => x)),
        "unsafe": unsafe,
      };
}
