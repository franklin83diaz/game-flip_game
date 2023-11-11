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

    //monitor tries
    controller.tries.listen((value) {
      if (value == 0) {
        Get.defaultDialog(
            barrierDismissible: false,
            title: "Game Over",
            middleText: "You Lose",
            confirm: TextButton(
                onPressed: () async {
                  Game.newGame();
                  Get.back();
                },
                child: const Text("New Game")));
      }
    });

    //monitor Win
    controller.flipCardData.listen((value) async {
      if (value.every((element) => element.isMatched == true)) {
        controller.score.value +=
            controller.tries.value * 8 * metaCardGameController.level.value;

        await Future.delayed(const Duration(milliseconds: 1000));

        //All level done
        if (metaCardGameController.level.value > 11) {
          Get.defaultDialog(
              //no close
              barrierDismissible: false,
              title: "Game Over",
              middleText:
                  "You Win !!!, All levels!!! :), Your Score is ${controller.score.value}",
              confirm: TextButton(
                  onPressed: () {
                    controller.tries.value = 9;
                    metaCardGameController.level.value = 1;
                    Game.newGame();
                    Get.back();
                  },
                  child: const Text("New Game")));
        }

        Get.defaultDialog(
            //no close
            barrierDismissible: false,
            title: "Game Over",
            middleText: "You Win, Your Score is ${controller.score.value}",
            confirm: TextButton(
                onPressed: () {
                  //up level
                  metaCardGameController.level.value++;

                  if (metaCardGameController.level.value > 3) {
                    controller.tries.value = 5;
                  }
                  //
                  if (metaCardGameController.level.value > 5) {
                    controller.tries.value = 4;
                  }
                  //
                  if (metaCardGameController.level.value > 7) {
                    controller.tries.value = 3;
                  }
                  //
                  if (metaCardGameController.level.value > 8) {
                    controller.tries.value = 2;
                  }
                  //
                  if (metaCardGameController.level.value > 9) {
                    controller.tries.value = 1;
                  }

                  Game.newGame();
                  Get.back();
                },
                child: const Text("New Game")));
      }
    });
  }
}
