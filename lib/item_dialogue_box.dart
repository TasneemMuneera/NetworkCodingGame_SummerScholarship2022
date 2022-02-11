import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';
import 'box_checker.dart';
Box_check_for_player box_check= Box_check_for_player();

class Item_dialoguebox extends StatelessWidget {
  Item_dialoguebox(this.color_body, this.box_value, this.box_want_value);
  final Color color_body;
  final String box_value;
  final String box_want_value;








  @override
  Widget build(BuildContext context) {




    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color_body),

      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(


          title: Text('Inventory'),
          content:  Text('I have $box_value, I want $box_want_value'),
          actions: <Widget>[

            TextButton(
              onPressed: () {

                Navigator.pop(context, 'OK');

                },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
      child:  Text('Items', style: Item_text,),

    );
  }
}
