import 'package:flutter/material.dart';

class FlipCardModel{
  final String img;
  final double key;

  FlipCardModel({required this.img, required this.key});
}

class DummyData{
  List<FlipCardModel> data = [
    FlipCardModel(img: "assets/image/flip_card/cat.png", key: 1),
    FlipCardModel(img: "assets/image/flip_card/cat.png", key: 1),
    FlipCardModel(img: "assets/image/flip_card/elephant.png", key: 2),
    FlipCardModel(img: "assets/image/flip_card/elephant.png", key: 2),
    FlipCardModel(img: "assets/image/flip_card/mouse.png", key: 3),
    FlipCardModel(img: "assets/image/flip_card/mouse.png", key: 3),
    FlipCardModel(img: "assets/image/flip_card/stick.png", key: 4),
    FlipCardModel(img: "assets/image/flip_card/stick.png", key: 4),
  ];

}