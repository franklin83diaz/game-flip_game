import 'package:get/get.dart';
import 'package:memory/controllers/flip_card_controller.dart';
import 'package:memory/models/flip_card_model.dart';

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
          : element.controller.toggleCardWithoutAnimation();
    }

    controller.flipCardData.value = DummyData().data;
    await Future.delayed(const Duration(milliseconds: 500));

    for (var element in controller.flipCardData) {
      element.controller.toggleCard();
    }
    await Future.delayed(const Duration(milliseconds: 3000));
    for (var element in controller.flipCardData) {
      element.controller.toggleCard();
    }

    controller.flipCardData.refresh();
    controller.isBusy.value = false;
  }
}
