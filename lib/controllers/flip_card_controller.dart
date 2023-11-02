import 'package:game/models/flip_card_model.dart';
import 'package:get/get.dart';

class FlipCardGameController extends GetxController{

  // final data = DummyData().data;
RxList<FlipCardModel> flipCardData =  DummyData().data.obs;




  shuffleFlipCard()async{
   flipCardData.shuffle();
  }
}