import 'package:anywhere_code_exercise/layout/character_list.dart';
import 'package:flutter/material.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CharacterList(
      isTablet: true,
    );
  }
}
