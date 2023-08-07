class SrcOptions {
  String directory;
  int isFanon;
  int isMediawiki;
  int isWikipedia;
  String language;
  String minAbstractLength;
  int skipAbstract;
  int skipAbstractParen;
  String skipEnd;
  int skipIcon;
  int skipImageName;
  String skipQr;
  String sourceSkip;
  String srcInfo;

  SrcOptions({
    required this.directory,
    required this.isFanon,
    required this.isMediawiki,
    required this.isWikipedia,
    required this.language,
    required this.minAbstractLength,
    required this.skipAbstract,
    required this.skipAbstractParen,
    required this.skipEnd,
    required this.skipIcon,
    required this.skipImageName,
    required this.skipQr,
    required this.sourceSkip,
    required this.srcInfo,
  });

  factory SrcOptions.fromJson(Map<String, dynamic> json) => SrcOptions(
        directory: json["directory"],
        isFanon: json["is_fanon"],
        isMediawiki: json["is_mediawiki"],
        isWikipedia: json["is_wikipedia"],
        language: json["language"],
        minAbstractLength: json["min_abstract_length"],
        skipAbstract: json["skip_abstract"],
        skipAbstractParen: json["skip_abstract_paren"],
        skipEnd: json["skip_end"],
        skipIcon: json["skip_icon"],
        skipImageName: json["skip_image_name"],
        skipQr: json["skip_qr"],
        sourceSkip: json["source_skip"],
        srcInfo: json["src_info"],
      );

  Map<String, dynamic> toJson() => {
        "directory": directory,
        "is_fanon": isFanon,
        "is_mediawiki": isMediawiki,
        "is_wikipedia": isWikipedia,
        "language": language,
        "min_abstract_length": minAbstractLength,
        "skip_abstract": skipAbstract,
        "skip_abstract_paren": skipAbstractParen,
        "skip_end": skipEnd,
        "skip_icon": skipIcon,
        "skip_image_name": skipImageName,
        "skip_qr": skipQr,
        "source_skip": sourceSkip,
        "src_info": srcInfo,
      };
}
