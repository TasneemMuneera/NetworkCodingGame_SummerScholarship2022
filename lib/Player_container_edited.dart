import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Player_container_edited extends StatelessWidget {

  Player_container_edited(this.color, this.icon, this.icon_color, this.size, );
  // this.color_body, this.box_value, this.box_want_value
  final color;

  final IconData icon;

  final Color icon_color;
  final double size;







  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Container(
      child: Icon(
      icon,
      color: icon_color,
      size: size,

     ),
        margin: EdgeInsets.all(3),
    //
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,


        ),


    ),

      ],

    );
  }
}

