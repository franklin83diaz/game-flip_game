class FlipCardModel{
  final String img;
  final int key;
  bool isFlipped;
  bool isMatched;

  FlipCardModel({
    required this.img,
    required this.key,
    required this.isFlipped,
  }) : isMatched = false;
}

class DummyData{
  List<FlipCardModel> data = [
    FlipCardModel(img: "assets/image/flip_card/cat.png", key: 1,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/cat.png", key: 1,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/elephant.png", key: 2,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/elephant.png", key: 2,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/mouse.png", key: 3,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/mouse.png", key: 3,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/stick.png", key: 4,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/stick.png", key: 4,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/fish.png", key: 5,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/fish.png", key: 5,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/leopard.png", key: 6,isFlipped: false),
    FlipCardModel(img: "assets/image/flip_card/leopard.png", key: 6,isFlipped: false),
  ];



}