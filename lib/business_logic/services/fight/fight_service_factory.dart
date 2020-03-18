
import 'package:start_app/business_logic/services/fight/easy_fight_service.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/business_logic/services/fight/hard_fight_service.dart';
import 'package:start_app/business_logic/services/fight/normal_fight_service.dart';
import 'package:start_app/models/fight_settings_model.dart';

abstract class IFightServiceFactory {
  IFightService create(Difficulty difficulty);
}

class FightServiceFactory implements IFightServiceFactory {
  IFightService create(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return EasyFightService();
      case Difficulty.normal:
        return NormalFightService();
      case Difficulty.hard:
        return HardFightService();
      default:
        assert(false, "Should never reach there");
        return null;
    }
  }
}