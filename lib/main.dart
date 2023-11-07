import 'package:flutter/material.dart';
import 'package:game/controllers/flip_card_controller.dart';
import 'package:game/logic/game.dart';
import 'package:game/pages/flip_card_memory_game.dart';
import 'package:get/get.dart';

void main() {
  //Initial controller
  Get.put(FlipCardGameController());
  Game.newGame();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FlipCardMemoryGame(),
    );
  }
}
