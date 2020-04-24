import 'dart:io';

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/di/builders.dart';
import 'package:start_app/business_logic/repositories/pokemon/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/business_logic/services/fight/fight_service_factory.dart';
import 'package:start_app/creational_patterns/abstract_factory/cupertino_widgets_factory.dart';
import 'package:start_app/creational_patterns/abstract_factory/material_widgets_factory.dart';
import 'package:start_app/creational_patterns/abstract_factory/widget_factory.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';
import 'package:start_app/structural_patterns/adapter/network_service_interface.dart';
import 'package:start_app/ui/screens/main_screen.dart';
import 'package:start_app/ui/screens/new_fight_screen.dart';
import 'package:start_app/ui/screens/single_fight_screen.dart';

class Injection {
  static final Injector injector = Injector.getInjector();

  static void initialize() {
    if (Platform.isIOS) {
      injector.map<WidgetFactory>((i) => CupertinoWidgetsFactory());
    }
    else if (Platform.isAndroid) {
      injector.map<WidgetFactory>((i) => MaterialWidgetsFactory());
    }
    else {
      assert(false, "Should never reach there");
    }

    injector.map<INetworkService>((i) => DioNetworkService());

    // services
    injector.map<IFightServiceFactory>((i) => FightServiceFactory(),
        isSingleton: true);
    injector.map<IPokemonRepository>((i) => DummyPokemonRepository(),
        isSingleton: true);

    // blocs
    injector.map<IMainMenuBloc>((i) => MainMenuBloc());
    injector.map<INewFightBloc>(
        (i) => NewFightBloc(pokemonRepository: i.get<IPokemonRepository>()));
    injector.mapWithParams<ISingleFightBloc>((i, dict) {
      final FightSettingsModel settings = dict["settings"];
      assert(settings != null, "Missed settings for SingleFightBloc creation");
      return SingleFightBloc(
          service: i.get<IFightServiceFactory>().create(settings));
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
