import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/flip_card_controller.dart';
import 'component/score_memory_game_widget.dart';

class FlipCardMemoryGame extends StatelessWidget {
  const FlipCardMemoryGame({super.key});

  @override
  Widget build(BuildContext context) {
    final FlipCardGameController controller =
        Get.find<FlipCardGameController>();
    double maxWidth = MediaQuery.of(context).size.width;
    final MetaGameController metaGameController =
        Get.find<MetaGameController>();

    return Scaffold(
      backgroundColor: const Color(0xFFe85d75),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            width: maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MEMORY GAME",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() => scoreWidget(
                        title: "TRIES", value: controller.tries.value)),
                    Obx(() => Text(
                          "LEVEL ${metaGameController.level.value}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        )),
                    Obx(() => scoreWidget(
                        title: "SCORE", value: controller.score.value)),
                  ],
                ),
                Obx(
                  () => GridView.builder(
                      padding: const EdgeInsets.only(top: 24),
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              metaGameController.level.value > 1 ? 3 : 2,
                          childAspectRatio:
                              metaGameController.level.value > 1 ? 3 / 4 : 1,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      itemCount: controller.flipCardData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Obx(
                          () => FlipCard(
                              controller:
                                  controller.flipCardData[index].controller,
                              onFlip: () async {
                                if (controller.isBusy.value == true) return;
                                if (controller.flipCardData[index].controller
                                        .state!.isFront ==
                                    true) {
                                  controller.flipCardData[index].isFlipped =
                                      true;
                                } else {
                                  controller.flipCardData[index].isFlipped =
                                      false;
                                }
                                //add to selected card
                                controller.selectedCard
                                    .add(controller.flipCardData[index]);

                                //check if selected card is 2
                                if (controller.selectedCard.length == 2) {
                                  //check if selected card is matched
                                  if (controller.selectedCard[0].key ==
                                      controller.selectedCard[1].key) {
                                    //if matched
                                    controller
                                        .flipCardData[
                                            controller.selectedCard[0].index]
                                        .isMatched = true;
                                    controller
                                        .flipCardData[
                                            controller.selectedCard[1].index]
                                        .isMatched = true;
                                    controller.selectedCard.clear();
                                  } else {
                                    //if not matched
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    controller.selectedCard[0].controller
                                        .toggleCard();
                                    controller.selectedCard[1].controller
                                        .toggleCard();
                                    controller.selectedCard.clear();
                                    //tries -1
                                    controller.tries.value--;
                                  }
                                }
                                controller.flipCardData.refresh();
                              },
                              flipOnTouch: controller.selectedCard.length < 2
                                  ? controller.flipCardData[index].isFlipped
                                      ? false
                                      : controller.isBusy.value
                                          ? false
                                          : true
                                  : false,
                              key: Key(index.toString()),
                              fill: Fill
                                  .fillFront, // Fill the back side of the card to make in the same size as the front.
                              direction: FlipDirection.HORIZONTAL, // default
                              side: CardSide
                                  .FRONT, // The side to initially display.
                              front: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(
                                    Icons.question_mark,
                                    color: Colors.white,
                                    size: 42,
                                  )),
                              back: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.asset(
                                      controller.flipCardData[index].img,
                                      fit: BoxFit.fill))),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
