import 'package:flutter/material.dart';

const appbar_color= Color(0xffcb4c3b);
const appbody_color= Color(0xffdbc2ba);
const background_card_color = Color(0xfff89c20);
const player_card_color = Color(0xffffd5cc);
const Rule_button_color= Color(0xffff5a922);
const Rule_card_color= Color(0xfff8d989);
const player_selection_color= Color(0xffffaf42);
const play_button_color= Color(0xff78b26d);
const Label_text= TextStyle(
    fontSize: 25.0,
    color: Colors.white,
  fontWeight: FontWeight.w900,
  fontFamily: 'Playfair Display',
  letterSpacing: 1.1,



);
const Result_description= TextStyle(
  fontSize: 20.0,
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontFamily: 'Playfair Display',
  letterSpacing: 2.5,



);
const Result_text = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w900,
  letterSpacing: 4.5,
  fontFamily: 'Playfair Display',
  color: Color(0xff097969),

);
const Button_text = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
  letterSpacing: 8.5,
  fontFamily: 'Playfair Display',
  color: Colors.white,

);
const Button_bottom_text = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  letterSpacing: 4.5,
  fontFamily: 'Playfair Display',
  color: Colors.white,

);
// Data packets, transmission packets
const Player_text= TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontFamily: 'Playfair Display',
  letterSpacing: 3.5,

);

const Card_text = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w900,

  fontFamily: 'Playfair Display',

);
const Item_text = TextStyle(

  fontSize: 18,
  fontWeight: FontWeight.w900,




  color: Colors.black,

);
enum Players {
  Red,
  Blue,
  Green,

}
List <String> box_names=[
  'Red box', 'Blue box', 'Green box'


];
// defining the side information possibility box of the red player
List <String> red_player_possibilities=[
   'Blue box', 'Green box', 'Green and Blue boxes', 'nothing'

];
List <String> green_player_possibilities=[
'nothing', 'Red box', 'Blue box', 'Red and Blue boxes'

];
List <String> blue_player_possibilities=[
  'nothing', 'Red box', 'Green box', 'Red and Green boxes'

];
