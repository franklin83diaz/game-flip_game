import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../controllers/flip_card_controller.dart';
import 'component/score_memory_game_widget.dart';

class FlipCardMemoryGame extends StatefulWidget {
  const FlipCardMemoryGame({Key? key}) : super(key: key);

  @override
  State<FlipCardMemoryGame> createState() => _FlipCardMemoryGameState();
}

class _FlipCardMemoryGameState extends State<FlipCardMemoryGame> {
final controller = Get.put(FlipCardGameController());
final  flipCardController =  FlipCardController();

@override
  void initState() {
    controller.initializeGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FlipCardController flipController = FlipCardController();
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFe85d75),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            width:maxWidth ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Text("MEMORY GAME",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 42,color: Colors.white
                ),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   scoreWidget(title: "TRIES",value: 0),
                   scoreWidget(title: "SCORE",value: 0),
                 ],
               ),

                Obx(
                    ()=> GridView.builder(
                    padding: EdgeInsets.only(top: 24),
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3 ,
                          childAspectRatio: 3.5 / 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      itemCount: controller.flipCardData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return FlipCard(
                          controller: flipController,
                          onFlip:(){
                            controller.flipCard(index);
                          },
                              flipOnTouch: true,
                              fill: Fill.fillFront, // Fill the back side of the card to make in the same size as the front.
                              direction: FlipDirection.HORIZONTAL, // default
                              side: CardSide.FRONT, // The side to initially display.
                              front: controller.flipCardData[index].isMatched ?
                             Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.asset(controller.flipCardData[index].img,fit: BoxFit.fill)
                                // const Icon(Icons.question_mark,color: Colors.white,size: 42,),
                              ): Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(Icons.question_mark,color: Colors.white,size: 42,)
                              ),
                              back: controller.flipCardData[index].isMatched ?
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.asset(controller.flipCardData[index].img,fit: BoxFit.fill)
                                // const Icon(Icons.question_mark,color: Colors.white,size: 42,),
                              ): Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(Icons.question_mark,color: Colors.white,size: 42,)
                              ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
