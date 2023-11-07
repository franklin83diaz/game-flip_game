import 'package:flip_card/flip_card_controller.dart';

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
  final int number;
  final List<FlipCardModel> data = [];

  DummyData(this.number) {
    for (int i = 0; i < number; i++) {
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

  List<String> pathImg = [
    "assets/image/flip_card/cat.png",
    "assets/image/flip_card/elephant.png",
    "assets/image/flip_card/mouse.png",
    "assets/image/flip_card/stick.png",
    "assets/image/flip_card/fish.png",
    "assets/image/flip_card/leopard.png",
  ];
}
