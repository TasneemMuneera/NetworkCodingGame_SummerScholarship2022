import 'package:flutter/material.dart';
// this class is need to fix the size and the colors of icons in the transmission packet

class Data_packet extends StatelessWidget {
  Data_packet(@required this.colour, this.icon,this.color, this.color2,this.color3, this.icon_2, this.icon_3 );
  final Color colour;
  final IconData icon;
  final Color color;
  final Color color2;
  final Color color3;
  final IconData icon_2;
  final IconData icon_3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
            color: color,
            size: 22,

          ),
          SizedBox(
            width: 8.0,
          ),
          Icon(icon_2,
            color: color2,
            size: 22,

          ),
          SizedBox(
            width: 8.0,
          ),
          Icon(icon_3,
            color: color3,
            size: 22,

          ),
        ],
      ),

      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(12.0),

      ) ,



    );
  }
}
