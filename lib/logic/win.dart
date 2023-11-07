import 'package:flutter/material.dart';
import 'package:game/controllers/flip_card_controller.dart';
import 'package:game/logic/game.dart';
import 'package:get/get.dart';

class WinLose {
  static start() {
    final FlipCardGameController controller =
        Get.find<FlipCardGameController>();

    //monitor tries
    controller.tries.listen((value) {
      if (value == 0) {
        Get.defaultDialog(
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
        controller.score.value += controller.tries.value * 8;

        await Future.delayed(const Duration(milliseconds: 1000));

        Get.defaultDialog(
            title: "Game Over",
            middleText: "You Win, Your Score is ${controller.score.value}",
            confirm: TextButton(
                onPressed: () {
                  Game.newGame();
                  Get.back();
                },
                child: const Text("New Game")));
      }
    });
  }
}
