import 'package:flutter/material.dart';

import 'constants.dart';

//this is used for designing the box containers
class Player_container extends StatelessWidget {
  Player_container(this.icon, this.icon_color, this.size);
  final IconData icon;

  final Color icon_color;
  final double size;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        color: icon_color,
        size: size,

      ),
      margin: EdgeInsets.only(top: 2.0),

    );
  }
}
