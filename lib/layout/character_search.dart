import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/main_common.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';
import 'package:anywhere_code_exercise/values.dart';
import 'package:flutter/material.dart';

class CharacterSearch extends StatefulWidget {
  const CharacterSearch(
      {super.key, required this.searchfocus, required this.allcharacters});
  final FocusNode searchfocus;
  final List<RelatedTopic> allcharacters;

  @override
  State<CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends State<CharacterSearch> {
  final TextEditingController _textcontroller = TextEditingController();
  void _runSearch(String enteredKeyword) {
    List<RelatedTopic> characters = [];
    if (enteredKeyword.isEmpty) {
      characters = widget.allcharacters;
    } else {
      characters = widget.allcharacters
          .where((character) => character.text
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    characterListStreamController.add(characters);

    if (characters.isNotEmpty) {
      characterIndexStreamController.add(characters.first);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.searchfocus,
      controller: _textcontroller,
      decoration: InputDecoration(
        labelText: searchString,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: FlavorConfig.instance.values.cardBackgroundSeletedColor),
        ),
        labelStyle: TextStyle(
          color: FlavorConfig.instance.values.searchItemColor,
        ),
        filled: true,
        fillColor: FlavorConfig.instance.values.cardBackgroundColor,
        suffixIcon: _textcontroller.text.isEmpty
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: FlavorConfig.instance.values.searchItemColor,
                ),
              )
            : IconButton(
                onPressed: () {
                  _textcontroller.clear();
                  _runSearch(emptyString);
                },
                icon: Icon(
                  Icons.clear,
                  color: FlavorConfig.instance.values.searchItemColor,
                ),
              ),
      ),
      onChanged: (value) => _runSearch(value),
    );
  }
}
