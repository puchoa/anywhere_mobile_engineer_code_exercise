class Developer {
  String name;
  String type;
  String url;

  Developer({
    required this.name,
    required this.type,
    required this.url,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        name: json["name"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "url": url,
      };
}
