import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({
    Key? key,
    required this.isTablet,
    required this.e,
  }) : super(key: key);
  final RelatedTopic e;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: isTablet ? null : AppBar(),
      backgroundColor: FlavorConfig.instance.values.cardBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.05),
          child: Column(
            children: [
              if (e.icon.url.isNotEmpty) ...[
                Center(
                  child: CachedNetworkImage(
                    imageUrl: "https://duckduckgo.com${e.icon.url}",
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: FlavorConfig.instance.values.displayColor,
                    ),
                  ),
                )
              ] else ...[
                if (e.name.isNotEmpty) ...[
                  Icon(Icons.error,
                      color: FlavorConfig.instance.values.displayColor),
                ]
              ],
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(e.description),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
