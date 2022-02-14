import 'package:flutter/material.dart';
import 'package:ss_test/constants.dart';
import 'screen1.dart';
import 'background_cards.dart';
import 'constants.dart';
import 'bottom_app_bar.dart';
class Screen4 extends StatelessWidget {
  Screen4(this.image, this.result, this.result_description);
  final String result;
  final String result_description;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results'),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 6,
                child: Background_cards(background_card_color,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(


                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                            child: Image(
                              image: NetworkImage(image),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,

                        ),
                        Expanded(

                            child: Background_cards(Colors.white54, Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(result, style: Result_text,),
                                SizedBox(
                                  height: 25,
                                ),

                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(result_description, style: Result_description,),
                                )

                              ],
                            )))



                      ],

                    ))),
            Expanded(
              flex: 1,
              child: Bottom_app_bar(play_button_color,
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, '/second');


                  }, child: Text('New game!',style: Button_bottom_text,),


                  )),
            ),
            Expanded(
              flex: 1,
              child: Bottom_app_bar(Color(0xffda2c43),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);




                  }, child: Text('Try again?',style: Button_bottom_text,),


                  )),
            ),
          ],
        )
    );
  }
}