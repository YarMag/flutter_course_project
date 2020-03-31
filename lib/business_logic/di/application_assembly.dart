import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/di/builders.dart';
import 'package:start_app/business_logic/di/injector_assembly.dart';
import 'package:start_app/business_logic/repositories/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/services/fight/fight_service_factory.dart';
import 'package:start_app/models/fight_settings_model.dart';
import 'package:start_app/ui/screens/highscores_screen.dart';
import 'package:start_app/ui/screens/main_screen.dart';
import 'package:start_app/ui/screens/new_fight_screen.dart';
import 'package:start_app/ui/screens/single_fight_screen.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';

class ApplicationAssembly {
  static StatefulWidget getCompositionRoot() {
    return _mainScreenBuilder();
  }

  static StatefulWidget getDICompositionRoot() {
    return (Injection.injector.get<MainScreenBuilder>(key: "mainScreen"))();
  }

  //#region Services
  static IFightServiceFactory _fightServiceFactory = FightServiceFactory();
  static IPokemonRepository _pokemonRepository = DummyPokemonRepository();
  //#endregion

  //#region Blocs
  static IMainMenuBloc _mainMenuBloc() => MainMenuBloc();
  static INewFightBloc _newFightBloc() =>
      NewFightBloc(pokemonRepository: _pokemonRepository);
  static ISingleFightBloc _singleFightBloc(FightSettingsModel settings) =>
      SingleFightBloc(
          service: _fightServiceFactory.create(settings.difficulty),
          settings: settings);
  static IHighscoresBloc _highscoreBloc() => HighscoresBloc();
  //#endregion

  //#region ScreenBuilders

  static MainScreenBuilder _mainScreenBuilder = () {
    return BlocProvider<IMainMenuBloc>(
      child: MainScreen(
        newFightScreenBuilder: _newFightScreenBuilder,
        highscoresScreenBuilder: _highscoresScreenBuilder,
      ),
      bloc: _mainMenuBloc(),
    );
  };

  static NewFightScreenBuilder _newFightScreenBuilder = () {
    return BlocProvider<INewFightBloc>(
      child:
          NewFightScreen(singleFightScreenBuilder: _singleFightScreenBuilder),
      bloc: _newFightBloc(),
    );
  };

  static SingleFightScreenBuilder _singleFightScreenBuilder =
      (FightSettingsModel settings) {
    return BlocProvider<ISingleFightBloc>(
      child: SingleFightScreen(),
      bloc: _singleFightBloc(settings),
    );
  };

  static HighscoresScreenBuilder _highscoresScreenBuilder = () {
    return BlocProvider<IHighscoresBloc>(
      child: HighscoresScreen(),
      bloc: _highscoreBloc(),
    );
  };

  //#endregion
}
