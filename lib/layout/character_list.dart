import 'package:anywhere_code_exercise/bloc/character_bloc.dart';
import 'package:anywhere_code_exercise/flavor_config.dart';
import 'package:anywhere_code_exercise/main_common.dart';
import 'package:anywhere_code_exercise/layout/character_card.dart';
import 'package:anywhere_code_exercise/layout/character_detail.dart';
import 'package:anywhere_code_exercise/models/related_topic_model.dart';
import 'package:anywhere_code_exercise/repos/repositories.dart';
import 'package:anywhere_code_exercise/layout/character_search.dart';
import 'package:anywhere_code_exercise/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,
    required this.isTablet,
  });
  final bool isTablet;

  @override
  State<CharacterList> createState() => CharacterListState();
}

class CharacterListState extends State<CharacterList> {
  List<RelatedTopic> foundCharacters = [];
  List<RelatedTopic> allcharacters = [];
  late RelatedTopic selectedCharacter;
  bool firstRun = true;
  int selectedCharacterIndex = 0;
  late Stream<RelatedTopic> characterDataStream;
  late Stream<List<RelatedTopic>> characterListDataStream;
  bool isEmpty = false;

  FocusNode searchfocus = FocusNode();

  @override
  void initState() {
    characterDataStream =
        characterIndexStreamController.stream.asBroadcastStream();
    characterListDataStream =
        characterListStreamController.stream.asBroadcastStream();
    super.initState();
  }

  Widget noFoundCharacter() {
    characterIndexStreamController.add(noCharacter);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(characterNotFoundString),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double listWidth = screenWidth * 0.4;
    return BlocProvider(
      create: (context) => CharacterBloc(
        RepositoryProvider.of<CharacterRepository>(context),
      )..add(LoadCharacterEvent()),
      child: Scaffold(
        backgroundColor: FlavorConfig.instance.values.listBackgroundColor,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text(
            FlavorConfig.instance.appTitle,
            style: TextStyle(
              fontFamily: FlavorConfig.instance.values.appBarFontFamily,
              color: FlavorConfig.instance.values.appBarFontColor,
            ),
          ),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
          if (state is CharacterLoadingState) {
            return Center(
              child: Text(emptyString),
            );
          }
          if (state is CharacterLoadedState) {
            FlutterNativeSplash.remove();
            allcharacters = state.characters.relatedTopics;

            if (firstRun) {
              if (foundCharacters.isEmpty) {
                foundCharacters = allcharacters;
              }
            }

            return Row(
              children: [
                SizedBox(
                  width: widget.isTablet ? listWidth : screenWidth,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 12, left: 12, bottom: 5.0),
                          child: CharacterSearch(
                            searchfocus: searchfocus,
                            allcharacters: allcharacters,
                          )),
                      Expanded(
                          child: StreamBuilder<List<RelatedTopic>>(
                              stream: characterListDataStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  foundCharacters = snapshot.data ?? [];
                                }

                                if (foundCharacters.isNotEmpty) {
                                  return CharacterCard(
                                    isTablet: widget.isTablet,
                                    foundCharacters: foundCharacters,
                                    allcharacters: allcharacters,
                                    searchfocus: searchfocus,
                                    selectedIndex: 0,
                                  );
                                }

                                return noFoundCharacter();
                              })),
                    ],
                  ),
                ),
                if (widget.isTablet && foundCharacters.isNotEmpty) ...[
                  SizedBox(
                      width: screenWidth - listWidth,
                      child: StreamBuilder<RelatedTopic>(
                          stream: characterDataStream,
                          builder: (context, snapshot) {
                            selectedCharacter = allcharacters.first;
                            if (snapshot.hasData) {
                              selectedCharacter =
                                  snapshot.data ?? allcharacters.first;
                            }

                            return CharacterDetail(
                              isTablet: widget.isTablet,
                              e: selectedCharacter,
                            );
                          }))
                ],
              ],
            );
          }

          if (state is CharacterErrorState) {
            return Center(
              child: Text(errorString),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
