import 'package:game/models/flip_card_model.dart';
import 'package:get/get.dart';

class FlipCardGameController extends GetxController {
  RxList<FlipCardModel> flipCardData = DummyData().data.obs;
  RxList<FlipCardModel> selectedCard = <FlipCardModel>[].obs;
  RxBool isBusy = false.obs;

  RxInt score = 0.obs;
  RxInt tries = 9.obs;
}

class MetaGameController extends GetxController {
  RxInt level = 1.obs;
}
