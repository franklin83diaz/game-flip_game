import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:memory/controllers/flip_card_controller.dart';

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
    List pathImg = pathImgLevel_1;

    // set path image by level
    if (metaCardGameController.level.value == 2) {
      pathImg = pathImgLevel_2;
    }
    if (metaCardGameController.level.value == 3) {
      pathImg = pathImgLevel_3;
    }
    if (metaCardGameController.level.value == 4) {
      pathImg = pathImgLevel_4;
    }
    if (metaCardGameController.level.value == 5) {
      pathImg = pathImgLevel_5;
    }
    if (metaCardGameController.level.value == 6) {
      pathImg = pathImgLevel_6;
    }
    if (metaCardGameController.level.value == 7) {
      pathImg = pathImgLevel_7;
    }
    if (metaCardGameController.level.value >= 8) {
      pathImg = pathImgLevel_8;
    }
    if (metaCardGameController.level.value >= 9) {
      pathImg = pathImgLevel_9;
    }
    if (metaCardGameController.level.value >= 10) {
      pathImg = pathImgLevel_10;
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

  List<String> pathImgLevel_1 = [
    "assets/image/level1/image2.png",
    "assets/image/level1/image3.png",
    "assets/image/level1/image4.png",
    "assets/image/level1/image5.png",
  ];

  List<String> pathImgLevel_2 = [
    "assets/image/level2/image1.png",
    "assets/image/level2/image2.png",
    "assets/image/level2/image3.png",
    "assets/image/level2/image4.png",
    "assets/image/level2/image5.png",
    "assets/image/level2/image6.png",
  ];

  List<String> pathImgLevel_3 = [
    "assets/image/level3/image1.png",
    "assets/image/level3/image2.png",
    "assets/image/level3/image3.png",
    "assets/image/level3/image4.png",
    "assets/image/level3/image5.png",
    "assets/image/level3/image6.png",
  ];

  List<String> pathImgLevel_4 = [
    "assets/image/level4/image1.png",
    "assets/image/level4/image2.png",
    "assets/image/level4/image3.png",
    "assets/image/level4/image4.png",
    "assets/image/level4/image5.png",
    "assets/image/level4/image6.png",
  ];

  List<String> pathImgLevel_5 = [
    "assets/image/level5/image1.png",
    "assets/image/level5/image2.png",
    "assets/image/level5/image3.png",
    "assets/image/level5/image4.png",
    "assets/image/level5/image5.png",
    "assets/image/level5/image6.png",
  ];

  List<String> pathImgLevel_6 = [
    "assets/image/level6/image1.png",
    "assets/image/level6/image2.png",
    "assets/image/level6/image3.png",
    "assets/image/level6/image4.png",
    "assets/image/level6/image5.png",
    "assets/image/level6/image6.png",
  ];

  List<String> pathImgLevel_7 = [
    "assets/image/level7/image1.png",
    "assets/image/level7/image2.png",
    "assets/image/level7/image3.png",
    "assets/image/level7/image4.png",
    "assets/image/level7/image5.png",
    "assets/image/level7/image6.png",
  ];

  List<String> pathImgLevel_8 = [
    "assets/image/level8/image1.png",
    "assets/image/level8/image2.png",
    "assets/image/level8/image3.png",
    "assets/image/level8/image4.png",
    "assets/image/level8/image5.png",
    "assets/image/level8/image6.png",
  ];

  List<String> pathImgLevel_9 = [
    "assets/image/level9/image1.png",
    "assets/image/level9/image2.png",
    "assets/image/level9/image3.png",
    "assets/image/level9/image4.png",
    "assets/image/level9/image5.png",
    "assets/image/level9/image6.png",
  ];

  List<String> pathImgLevel_10 = [
    "assets/image/level10/image1.png",
    "assets/image/level10/image2.png",
    "assets/image/level10/image3.png",
    "assets/image/level10/image4.png",
    "assets/image/level10/image5.png",
    "assets/image/level10/image6.png",
  ];
}
