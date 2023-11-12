import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory/controllers/flip_card_controller.dart';
import 'package:memory/logic/game.dart';
import 'package:memory/logic/win_lose.dart';
import 'package:memory/pages/flip_card_memory_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //Initial controller
  Get.put(MetaGameController());
  Get.put(FlipCardGameController());
  Game.newGame();
  WinLose.start();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Memory Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FlipCardMemoryGame(),
    );
  }
}
