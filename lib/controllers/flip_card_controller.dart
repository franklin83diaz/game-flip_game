import 'package:game/models/flip_card_model.dart';
import 'package:get/get.dart';

class FlipCardGameController extends GetxController {
  // final data = DummyData().data;
  RxList<FlipCardModel> flipCardData = DummyData(6).data.obs;
  RxList<FlipCardModel> selectedCard = <FlipCardModel>[].obs;
  RxBool isBusy = false.obs;

  RxInt score = 0.obs;
  RxInt tries = 5.obs;
}
