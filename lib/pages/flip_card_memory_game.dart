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
    controller.shuffleFlipCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFe85d75),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          width:maxWidth ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("MEMORY\nGAME",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
              fontSize: 42),),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 scoreWidget(title: "TRIES",value: 0),
                 scoreWidget(title: "SCORE",value: 0),
               ],
             ),

              GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3 ,
                      childAspectRatio: 5 / 6,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: controller.flipCardData.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return FlipCard(
                      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                      direction: FlipDirection.HORIZONTAL, // default
                      side: CardSide.FRONT, // The side to initially display.
                      front: Container(
                        child:  Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              child: Image.asset(controller.flipCardData[index].img,fit: BoxFit.fill),
                            )
                          // const Icon(Icons.question_mark,color: Colors.white,size: 42,),
                        );,
                      ),
                      back: Container(
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              child:const Icon(Icons.question_mark,color: Colors.white,size: 42,),
                            )
                        ),
                      ),

                    );
                  }),

            ],

          ),
        ),
      ),
    );
  }
}
