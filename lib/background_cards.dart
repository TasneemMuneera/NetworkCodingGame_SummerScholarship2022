import 'package:flutter/material.dart';

class Background_cards extends StatelessWidget {
  Background_cards(@required this.colour , this.card_child  );
  final Color colour;
  final Widget card_child;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: card_child,

      margin: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(12.0),

      ) ,



    );
  }
}
