class Icon {
  String height;
  String url;
  String width;

  Icon({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["Height"],
        url: json["URL"],
        width: json["Width"],
      );

  Map<String, dynamic> toJson() => {
        "Height": height,
        "URL": url,
        "Width": width,
      };
}
