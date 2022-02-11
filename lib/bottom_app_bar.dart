import 'package:flutter/material.dart';

class Bottom_app_bar extends StatelessWidget {
  Bottom_app_bar(@required this.colour , this.card_child  );
  final Color colour;
  final Widget card_child;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: card_child,

      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: colour,


      ) ,



    );
  }
}
