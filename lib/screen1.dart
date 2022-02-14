import 'package:flutter/material.dart';
import 'package:ss_test/Screen2.dart';

import 'constants.dart';



class Screen1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Network Coding Game'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              shape:  MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  )),

              backgroundColor: MaterialStateProperty.all(Rule_button_color),


            ),
          onPressed: () => showDialog<String>(
            context: context,
             builder: (BuildContext context) => AlertDialog(
               backgroundColor: Rule_card_color,
              title: const Text('Read the instructions below:'),
               content: const Text('1. Check the items of each player. \n\n2. Drag the boxes on the transmission packet to design your transmission for the player. \n\n3. Click the transmit button to commence. \n\n4. To delete click on the clear button.'),
               actions: <Widget>[

             ElevatedButton(
               style: ButtonStyle(
                 shape:  MaterialStateProperty.all<OutlinedBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(
                         Radius.circular(20.0),
                       ),
                     )),

                 backgroundColor: MaterialStateProperty.all(Rule_button_color),


               ),

               onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
          ),
           ],
           ),
           ),
          child: const Text('Rules?', style: Button_text,),
         ),
          SizedBox(
            height: 20,
          ),


          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                shape:  MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    )),

                backgroundColor: MaterialStateProperty.all(play_button_color),


              ),



              child: Text('Play!', style: Button_text,),
              onPressed: (){
                Navigator.pushNamed(context, '/second');

              },


            ),
          ),

        ]

      ),
    );
  }
}
