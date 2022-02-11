
import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
// this class gives alert for if green_count>1
class Green{

  bool alert_giver_green(int count_green){

    if(count_green>1){
       Alert(message: 'Cannot be taken more than one').show();
      return true;



    }
    else{
      return false;
    }



  }
}