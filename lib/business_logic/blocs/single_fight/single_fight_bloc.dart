import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

class SingleFightBloc extends ISingleFightBloc {
  final IFightService _fightService;

  SingleFightBloc(
      {@required IFightService service, @required FightSettingsModel settings})
      : this._fightService = service {
    // TODO: obtain pokemons and build PokemonFightModel objects
  }

  FightStateModel getFightState() {
    // TODO: implement
    return null;
  }

  void onUserAbilitySelected(AbilityModel ability) {
    // TODO: implement
  }

  void onLeaveFight() {
    // TODO: implement
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
