import 'package:game/controllers/flip_card_controller.dart';
import 'package:game/models/flip_card_model.dart';
import 'package:get/get.dart';

class Game {
  //new game
  static void newGame() async {
    final FlipCardGameController controller =
        Get.find<FlipCardGameController>();
    controller.isBusy.value = true;
    controller.selectedCard.value = [];

    //reset data
    for (var element in controller.flipCardData) {
      element.isFlipped = false;
      element.isMatched = false;
      element.controller.state?.isFront == true
          ? null
          : element.controller.toggleCard();
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    controller.flipCardData.value = DummyData(6).data;
    await Future.delayed(const Duration(milliseconds: 500));

    for (var element in controller.flipCardData) {
      element.controller.toggleCard();
    }
    await Future.delayed(const Duration(milliseconds: 10000));
    for (var element in controller.flipCardData) {
      element.controller.toggleCard();
    }

    controller.score.value = 0;
    controller.tries.value = 5;
    controller.isBusy.value = false;
  }
}
