class Maintainer {
  String github;

  Maintainer({
    required this.github,
  });

  factory Maintainer.fromJson(Map<String, dynamic> json) => Maintainer(
        github: json["github"],
      );

  Map<String, dynamic> toJson() => {
        "github": github,
      };
}
