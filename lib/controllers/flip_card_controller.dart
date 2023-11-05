import 'package:flutter/foundation.dart';
import 'package:game/models/flip_card_model.dart';
import 'package:get/get.dart';

class FlipCardGameController extends GetxController {
  // final data = DummyData().data;
  RxList<FlipCardModel> flipCardData = DummyData().data.obs;
  RxList<FlipCardModel> selectedCard = <FlipCardModel>[].obs;
  RxBool isProcessing = false.obs;

  void initializeGame() {
    flipCardData.shuffle();
  }

  void flipCard(int index) {
    if (kDebugMode) {
      print("taped");
    }
    if (isProcessing.value || flipCardData[index].isMatched) return;
    if (selectedCard.length < 2) {
      flipCardData[index].isFlipped = !flipCardData[index].isFlipped;
      selectedCard.add(flipCardData[index]);
      if (selectedCard.length == 2) {
        isProcessing.value = true;
        Future.delayed(const Duration(seconds: 3), () {
          if (selectedCard.first.key == selectedCard.last.key) {
            selectedCard.first.isMatched = true;
            selectedCard.last.isMatched = true;
          }
          selectedCard.clear();
          isProcessing.value = false;
        });
      }
    }
  }
}
