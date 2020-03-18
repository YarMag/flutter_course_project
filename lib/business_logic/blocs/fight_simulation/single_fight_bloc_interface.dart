
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/ability_model.dart';
import 'package:start_app/models/fight_state_model.dart';

abstract class ISingleFightBloc extends BlocBase {
  FightStateModel getFightState();
  void onUserAbilitySelected(AbilityModel ability);
  void onLeaveFight();
}