import 'package:flip_card/flip_card_controller.dart';
import 'package:game/controllers/flip_card_controller.dart';
import 'package:get/get.dart';

class FlipCardModel {
  final String img;
  final int key;
  bool isFlipped;
  bool isMatched;
  FlipCardController controller;
  int index;

  FlipCardModel({
    required this.index,
    required this.img,
    required this.key,
    required this.isFlipped,
    required this.controller,
  }) : isMatched = false;
}

class DummyData {
  final List<FlipCardModel> data = [];

  DummyData() {
    MetaGameController metaCardGameController = Get.find<MetaGameController>();

    int numberCard = metaCardGameController.level.value > 1 ? 6 : 3;
    List pathImg = pathImgLevel1_3;

    // set path image by level
    if (metaCardGameController.level.value > 3) {
      pathImg = pathImgLevel3_6;
    }
    if (metaCardGameController.level.value > 6) {
      pathImg = pathImgLevel6_9;
    }
    if (metaCardGameController.level.value > 9) {
      pathImg = pathImgLevel_9_15;
    }
    if (metaCardGameController.level.value > 15) {
      pathImg = pathImgLevel_15_20;
    }

    pathImg.shuffle();
    for (int i = 0; i < numberCard; i++) {
      data.add(FlipCardModel(
          index: 0,
          img: pathImg[i],
          key: i,
          isFlipped: false,
          controller: FlipCardController()));

      data.add(FlipCardModel(
          index: 0,
          img: pathImg[i],
          key: i,
          isFlipped: false,
          controller: FlipCardController()));
    }
    data.shuffle();
    for (int i = 0; i < data.length; i++) {
      data[i].index = i;
    }
  }

  //variades
  List<String> pathImgLevel1_3 = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];

  //animales
  List<String> pathImgLevel3_6 = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];

  //frutis
  List<String> pathImgLevel6_9 = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];

  //cards
  List<String> pathImgLevel_9_15 = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];

  //faces
  List<String> pathImgLevel_15_20 = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];
}
