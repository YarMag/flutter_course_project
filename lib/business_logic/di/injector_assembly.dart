import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/fight_simulation/single_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/fight_simulation/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/di/builders.dart';
import 'package:start_app/business_logic/repositories/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';
import 'package:start_app/business_logic/services/fight/fight_service_factory.dart';
import 'package:start_app/models/fight_settings_model.dart';
import 'package:start_app/ui/screens/main_screen.dart';
import 'package:start_app/ui/screens/new_fight_screen.dart';
import 'package:start_app/ui/screens/single_fight_screen.dart';

class Injection {
  static final Injector injector = Injector.getInjector();

  static void initialize() {
    // services
    injector.map<IFightServiceFactory>((i) => FightServiceFactory(),
        isSingleton: true);
    injector.map<IPokemonRepository>((i) => DummyPokemonRepository(),
        isSingleton: true);

    // blocs
    injector.map<IMainMenuBloc>((i) => MainMenuBloc());
    injector.map<INewFightBloc>((i) => NewFightBloc(pokemonRepository: i.get<IPokemonRepository>()));
    injector.mapWithParams<ISingleFightBloc>((i, dict) {
      final FightSettingsModel settings = dict["settings"];
      assert(settings != null, "Missed settings for SingleFightBloc creation");
      return SingleFightBloc(
          settings: settings,
          service: i.get<IFightServiceFactory>().create(settings.difficulty));
    });

    // screen builders
    injector.map<SingleFightScreenBuilder>(
        (i) => (FightSettingsModel settings) {
              return BlocProvider<ISingleFightBloc>(
                child: SingleFightScreen(),
                bloc: i.get<ISingleFightBloc>(
                    additionalParameters: {"settings": settings}),
              );
            },
        isSingleton: true,
        key: "singleFightScreen");

    injector.map<NewFightScreenBuilder>(
        (i) => () {
              return BlocProvider<INewFightBloc>(
                child: NewFightScreen(
                    singleFightScreenBuilder: i.get<SingleFightScreenBuilder>(
                        key: "singleFightScreen")),
                bloc: i.get<INewFightBloc>(),
              );
            },
        isSingleton: true,
        key: "newFightScreen");

    injector.map<MainScreenBuilder>(
        (i) => () {
              return BlocProvider<IMainMenuBloc>(
                child: MainScreen(
                  newFightScreenBuilder:
                      i.get<NewFightScreenBuilder>(key: "newFightScreen"),
                ),
                bloc: i.get<IMainMenuBloc>(),
              );
            },
        isSingleton: true,
        key: "mainScreen");
  }
}
