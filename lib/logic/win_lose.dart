import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memory/controllers/flip_card_controller.dart';
import 'package:memory/logic/game.dart';

class WinLose {
  static start() {
    final FlipCardGameController controller =
        Get.find<FlipCardGameController>();
    final MetaGameController metaCardGameController =
        Get.find<MetaGameController>();

    //monitor lose
    controller.tries.listen((value) {
      if (value == 0) {
        Get.defaultDialog(
            barrierDismissible: false,
            title: "Game Over",
            middleText: "You Lose",
            confirm: TextButton(
                onPressed: () async {
                  setTries();
                  Game.newGame();
                  Get.back();
                },
                child: const Text("New Game")));
      }
    });

    //monitor Win
    controller.flipCardData.listen((value) async {
      //Win All level
      if (value.every((element) => element.isMatched == true)) {
        controller.score.value +=
            controller.tries.value * 8 * metaCardGameController.level.value;

        //All level done
        if (metaCardGameController.level.value >= 10) {
          Get.defaultDialog(
              //no close
              barrierDismissible: false,
              title: "Game Over",
              middleText:
                  "You Win!!!, All levels!!! :), Your Score is ${controller.score.value}",
              confirm: TextButton(
                  onPressed: () {
                    controller.tries.value = 9;
                    metaCardGameController.level.value = 1;
                    setTries();
                    Game.newGame();
                    Get.back();
                  },
                  child: const Text("New Game")));
          return;
        }

        controller.confetti.value = true;
        await Future.delayed(const Duration(milliseconds: 1000));

        Get.defaultDialog(
            barrierDismissible: false,
            title: "Game Over",
            middleText: "You Win, Your Score is ${controller.score.value}",
            confirm: TextButton(
                onPressed: () {
                  controller.confetti.value = false;
                  //up level
                  metaCardGameController.level.value++;
                  setTries();

                  Game.newGame();
                  Get.back();
                },
                child: const Text("New Game")));
      }
    });

    //Monitor match
    controller.selectedCard.listen((value) async {
      // if (controller.selectedCard.length > 2) {
      //   return;
      // }
      //check if selected card is 2
      if (controller.selectedCard.length == 2) {
        //check if selected card is matched
        if (controller.selectedCard[0].key == controller.selectedCard[1].key) {
          //if matched
          controller.flipCardData[controller.selectedCard[0].index].isMatched =
              true;
          controller.flipCardData[controller.selectedCard[1].index].isMatched =
              true;
          controller.selectedCard.clear();
        } else {
          await Future.delayed(const Duration(milliseconds: 1000));
          //if not matched
          controller.selectedCard[0].controller.toggleCard();
          controller.selectedCard[1].controller.toggleCard();
          controller.selectedCard.clear();
          //tries -1
          controller.tries.value--;
        }
      }
    });
  }
}

setTries() {
  final MetaGameController metaCardGameController =
      Get.find<MetaGameController>();
  final FlipCardGameController controller = Get.find<FlipCardGameController>();

  //level 1
  if (metaCardGameController.level.value == 1) {
    controller.tries.value = 9;
  }
  //level 2
  if (metaCardGameController.level.value == 2) {
    controller.tries.value = 7;
  }
  //level 3
  if (metaCardGameController.level.value == 3) {
    controller.tries.value = 6;
  }
  //level 4-5
  if (metaCardGameController.level.value > 3 &&
      metaCardGameController.level.value <= 5) {
    controller.tries.value = 5;
  }
  //level 6
  if (metaCardGameController.level.value == 6) {
    controller.tries.value = 4;
  }
  //level 7
  if (metaCardGameController.level.value == 7) {
    controller.tries.value = 3;
  }
  //level 8
  if (metaCardGameController.level.value == 8) {
    controller.tries.value = 2;
  }
  //level 9-10
  if (metaCardGameController.level.value >= 9) {
    controller.tries.value = 1;
  }
}
