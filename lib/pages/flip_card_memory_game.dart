import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
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

    List<int> activePointers = <int>[];

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
                Listener(
                  onPointerDown: (details) {
                    activePointers.add(details.pointer);
                    if (activePointers.length > 2) {
                      Get.defaultDialog(
                          title: "Warning",
                          middleText: "You can only select 2 cards");
                    }
                  },
                  onPointerUp: (details) {
                    activePointers.remove(details.pointer);
                  },
                  onPointerCancel: (details) {
                    activePointers.remove(details.pointer);
                  },
                  child: Obx(
                    () => GridView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                metaGameController.level.value > 1 ? 3 : 2,
                            childAspectRatio: metaGameController.level.value > 1
                                ? 3.5 / 4
                                : 1,
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
                                    //!Remove this
                                    controller.flipCardData[index].isFlipped =
                                        true;
                                    //add to selected card
                                    controller.selectedCard
                                        .add(controller.flipCardData[index]);
                                    controller.flipCardData.refresh();
                                  } else {
                                    controller.flipCardData[index].isFlipped =
                                        false;
                                  }
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
                                    child: kDebugMode
                                        ? Text(
                                            controller.flipCardData[index].key
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 42),
                                          )
                                        : const Icon(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
