import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breakingbad/data/models/characters.dart';
import 'package:flutter_breakingbad/data/repository/characters_repository.dart';
import 'package:flutter_breakingbad/data/restApi/characters_api.dart';
import 'package:flutter_breakingbad/presentation/screens/character_screen.dart';
import 'package:flutter_breakingbad/presentation/screens/characters_details.dart';

import 'business_logic/cubit/character_cubit.dart';
import 'constants/strings.dart';

class AppRouter {

  late CharactersRepository charactersRepository;
  late CharacterCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersApi());
    charactersCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharacterScreen(),
          ),
        );
      case characterDetails:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character,),
        );
    }
  }
}
