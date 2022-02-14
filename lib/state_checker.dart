
import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
//This class gives alerts and state checker function is for adding boxes to transmission packets.
class State_checker{

// This is used for updating colors to the transmission packet icons
  Color color_check_transmission_icons(bool value_red, bool value_green, bool value_blue, bool red_state, bool blue_state, bool green_state)
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
  // this is used for assigning the colors to the "Players have" column
  Color color_assign_boxes(String color_value)
  {
    Color color= Colors.transparent;
    if(color_value=='Red box')
      {
        color= Colors.red;
      }
    else if (color_value=='Green box')
      {
        color= Colors.green;
      }
    else if (color_value=='Blue box')
    {
      color= Colors.blue;
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
