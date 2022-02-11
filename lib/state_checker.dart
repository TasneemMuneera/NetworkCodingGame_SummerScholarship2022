
import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
//This class gives alerts and state checker function is for adding boxes to transmission packets.
class State_checker{


  Color state_check1(bool value_red, bool value_green, bool value_blue, bool red_state, bool blue_state, bool green_state)
  {
    Color color= Colors.transparent;
    if(red_state==true)
      {
        if(value_red==false)
          {
            color= Colors.red;

          }

      }
    else if(green_state==true)
    {
      if(value_green==false)
      {
        color= Colors.green;

      }

    }
    else if(blue_state==true)
    {
      if(value_blue==false)
      {
        color= Colors.blue;

      }

    }

    return color;

  }



 bool alert_giver_red(int count_red){

    if(count_red>1){
       Alert(message: 'Cannot be taken more than one').show();
      return true;



    }
    return false;



  }
 bool alert_giver_blue(int count_blue){

   if(count_blue>1){
      Alert(message: 'Cannot be taken more than one').show();
     return true;



   }
   return false;



 }
 Color delete_color(Color color_delete){
    Color color_send= Colors.transparent;
    if (color_delete==Colors.red){
      return color_send;

    }
    else if (color_delete==Colors.blue){
      return color_send;
    }
    else if (color_delete==Colors.green){
      return color_send;
    }
    return color_delete;



 }


}
// Color state_check(bool value_red, bool value_green, bool value_blue, bool red_state, bool blue_state, bool green_state)
// {
//   Color color= Colors.transparent;
//   if(value_red==true && value_green==true && value_blue==true ){
//   }
//   else if (value_red==true && value_green==false && value_blue==false){
//     if (red_state == true){
//
//     }
//     if (green_state == true){
//       return Colors.green;
//     }
//     if (blue_state==true){
//       return Colors.blue;
//     }
//   }
//   else if (value_red==true && value_green==true && value_blue==false){
//     if (red_state == true){
//
//     }
//     if (green_state == true){
//
//     }
//     if (blue_state==true){
//       return Colors.blue;
//     }
//   }
//   else if (value_red==true && value_green==false && value_blue==true){
//     if (red_state == true){
//
//     }
//     if (green_state == true){
//       return Colors.green;
//     }
//     if (blue_state==true){
//
//     }
//   }
//   else if (value_red==false && value_green==true && value_blue==false){
//     if (red_state == true){
//       return Colors.red;
//     }
//     if (green_state == true){
//
//     }
//     if (blue_state==true){
//       return Colors.blue;
//     }
//   }
//   else if (value_red==false && value_green==true && value_blue==true){
//     if (red_state == true){
//       return Colors.red;
//     }
//     if (green_state == true){
//
//     }
//     if (blue_state==true){
//
//     }
//   }
//   else if (value_red==true && value_green==true && value_blue==false){
//     print("red true green true blue false");
//     if (red_state == true){
//       print("red true green true blue false blue state false");
//     }
//     if (green_state == true){
//       print("red true green true blue false blue state false");
//     }
//     if (blue_state==true){
//       print("red true green true blue false blue state true");
//       return Colors.blue;
//     }
//   }
//   else if (value_red== false && value_green==false && value_blue==true){
//     if (red_state == true){
//       return Colors.red;
//     }
//     if (green_state == true){
//       return Colors.green;
//     }
//     if (blue_state==true){
//     }
//   }
//   else if (value_red == false && value_green==true && value_blue==true){
//     if (red_state == true){
//       return  Colors.red;
//     }
//     if (green_state == true){
//     }
//     if (blue_state==true){
//     }
//   }
//   else if (value_red== true && value_green==false && value_blue==true){
//     if (red_state == true){
//     }
//     if (green_state == true){
//       return  Colors.green;
//     }
//     if (blue_state==true){
//     }
//   }
//   else if (value_red== false && value_green==false && value_blue==false){
//     if (red_state == true){
//       return Colors.red;
//     }
//     if (green_state == true){
//       return Colors.green;
//     }
//     if (blue_state==true){
//       return Colors.blue;
//     }
//   }
//
//   return color;
//
// }