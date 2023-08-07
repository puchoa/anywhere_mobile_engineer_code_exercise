import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/main_common.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';
import 'package:anywhere_code_exercise/layout/character_detail.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterCard extends StatefulWidget {
  CharacterCard(
      {super.key,
      required this.isTablet,
      required this.foundCharacters,
      required this.allcharacters,
      required this.searchfocus,
      required this.selectedIndex});

  final bool isTablet;
  final List<RelatedTopic> foundCharacters;
  final List<RelatedTopic> allcharacters;
  final FocusNode searchfocus;
  int selectedIndex;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.foundCharacters.length,
        itemBuilder: (_, index) {
          if (widget.foundCharacters.isEmpty) {}
          return Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 3,
            ),
            child: InkWell(
              onTap: () {
                widget.searchfocus.unfocus();
                characterIndexStreamController
                    .add(widget.foundCharacters[index]);

                setState(() {
                  widget.selectedIndex = index;
                });

                if (widget.isTablet) {
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CharacterDetail(
                            isTablet: widget.isTablet,
                            e: widget.foundCharacters[index],
                          )));
                }
              },
              child: Card(
                color: widget.isTablet && widget.selectedIndex == index
                    ? FlavorConfig.instance.values.cardBackgroundSeletedColor
                    : FlavorConfig.instance.values.cardBackgroundColor,
                child: ListTile(
                    title: Text(
                  widget.foundCharacters[index].name,
                )),
              ),
            ),
          );
        });
  }
}
