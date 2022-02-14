import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scidart/numdart.dart';
import 'package:ss_test/bottom_app_bar.dart';
import 'package:ss_test/pivot_data_check.dart';
import 'package:ss_test/constants.dart';
import 'package:ss_test/screen3.dart';
import 'background_cards.dart';
import 'box_containers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'item_dialogue_box.dart';
import'package:ss_test/Player_container_edited.dart';
import 'data_packet.dart';
import 'state_checker.dart';
import 'test.dart';
import 'package:gauss_jordan/gauss_jordan.dart';
import "dart:math";
import 'package:extended_math/extended_math.dart';
import 'mtrix2array.dart';
import 'package:ss_test/sreen4.dart';
import 'mod2_matrix.dart';


State_checker state= State_checker();
Green test=Green();
Pivot_data_check pivot= Pivot_data_check();
List2_Array2d list2_array2d= List2_Array2d();
Matrix_result_calculation matrix_result= Matrix_result_calculation();



T getRandomElement<T>(List<T> box_names) {
  final random = new Random();
  var i = random.nextInt(box_names.length);
  return box_names[i];
}





class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  //pivot_values container variables
  int red_pivot=0;
  int green_pivot=0;
  int blue_pivot=0;

  // Player_box_data randomly from their boxes
  String red_player_box= getRandomElement(red_player_possibilities);
  String green_player_box= getRandomElement(green_player_possibilities);
  String blue_player_box= getRandomElement(blue_player_possibilities);
  // Colors for gesture update of players
  Color player_card1=Colors.transparent;
  Color player_card2= Colors.transparent;
  Color player_card3=Colors.transparent;
  // side information arrays of red player
  List<double> arr1_red=[0,0,0];
  List<double> arr2_red=[0,0,0];
  // side information arrays of green player
  List<double> arr1_green=[0,0,0];
  List<double> arr2_green=[0,0,0];
  // side information arrays of blue player
  List<double> arr1_blue=[0,0,0];
  List<double> arr2_blue=[0,0,0];



  // round 3 data add and delete
  int A_data=0;
  int B_data=0;
  int C_data=0;
  // round 2 data add and delete
  int A_data2=0;
  int B_data2=0;
  int C_data2=0;
  // round 1 data add and delete
  int A_data1=0;
  int B_data1=0;
  int C_data1=0;


  // values for how many times an action happend for first packet.
  int count_red=0;
  int count_blue=0;
  int count_green=0;
  // count data for second packet
  int count_red2=0;
  int count_blue2=0;
  int count_green2=0;
  //count data for third round
  int count_red3=0;
  int count_blue3=0;
  int count_green3=0;


  // values for defining drag action
  bool red_state = false;
  bool green_state=false;
  bool blue_state=false;
  //Icons for data packet
  IconData icon=FontAwesomeIcons.box;
  IconData icon2=FontAwesomeIcons.box;
  IconData icon3=FontAwesomeIcons.box;
  // first round for colors
  Color color=Colors.transparent;
  Color color2=Colors.transparent;
  Color color3=Colors.transparent;
  //second round colors
  Color color2_red=Colors.transparent;
  Color color2_green=Colors.transparent;
  Color color2_blue=Colors.transparent;
  // third round for colors.
  Color color3_red=Colors.transparent;
  Color color3_green=Colors.transparent;
  Color color3_blue=Colors.transparent;
  // transmission vars for the matrix
  // 1st round
  double A_t_1=0;
  double B_t_1=0;
  double C_t_1=0;
  // 2nd round
  double A_t_2=0;
  double B_t_2=0;
  double C_t_2=0;
  //3rd round
  double A_t_3=0;
  double B_t_3=0;
  double C_t_3=0;

  // transmission packet checker
  bool packet_1=false;
  bool packet_2=false;
  bool packet_3=false;
  // the box want values for the players
  String check1= 'Red box';
  String check2= 'Green box';
  String check3= 'Blue box';
  // keeping pivot row_numbers for further checking
  int red_pivot_row_number=0;
  int green_pivot_row_number=0;
  int blue_pivot_row_number=0;
  // further_check_pivot: if anything is after the pivot or not
  int red_pivot_further=0;
  int green_pivot_further=0;
  int blue_pivot_further=0;
  // Screen 3 parameters
  String image_link='';
  String result='';
  String result_description='';
  // star position count
  int star_count=0;
  //total_test_count
  int total_test_count=0;
  //finding the min_rank
  int min_rank=0;

  // desgin of the transmission
  int total_design=0;
  int design1=0;
  int design2=0;
  int design3=0;

  // color assign boxes for "players have"
  Color red_box2= Colors.transparent;
  Color green_box2=Colors.transparent;
  Color blue_box2=Colors.transparent;




  @override
  Widget build(BuildContext context) {
    Color red_box1=state.color_assign_boxes(red_player_box);
    Color green_box1=state.color_assign_boxes(green_player_box);
    Color blue_box1=state.color_assign_boxes(blue_player_box);
    if(red_player_box=='Green and Blue boxes')
      {
        red_box1=Colors.green;
        red_box2= Colors.blue;
      }
    if(green_player_box=='Red and Blue boxes')
    {
      green_box1=Colors.red;
      green_box2= Colors.blue;
    }
    if(blue_player_box=='Red and Green boxes')
    {
      blue_box1=Colors.red;
      blue_box2= Colors.green;
    }
    // print(red_player_box);
    // print(green_player_box);
    // print(blue_player_box);


    return Scaffold(
        appBar: AppBar(
          title: Text('Design Your Transmission'),
        ),
        body : Column(


          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              flex: 2,

                child: Background_cards(background_card_color,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,


                      children: [
                        Center(child: Text('Data Packets!', style: Player_text,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onVerticalDragDown: (details) {
                                 setState(() {
                                   red_state=true;
                                   blue_state=false;
                                   green_state=false;


                                 });

                                },
                                child: Draggable<int>(
                                  data: 1,
                                  child: Box_container(FontAwesomeIcons.box, Colors.red,30 ),
                                  feedback: Box_container(FontAwesomeIcons.box, Colors.red,30 ) ,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onVerticalDragDown: (details) {
                                  setState(() {
                                    red_state=false;
                                    blue_state=false;
                                    green_state=true;


                                  });

                                },
                                child: Draggable<int>(
                                  data: 1,
                                  child:  Box_container(FontAwesomeIcons.box, Colors.green, 30),
                                  feedback: Box_container(FontAwesomeIcons.box, Colors.green, 30),
                                ),
                              ),
                            ),
                            Expanded(child:
                            GestureDetector(

                              onVerticalDragDown: (details) {
                                setState(() {
                                  red_state=false;
                                  blue_state=true;
                                  green_state=false;


                                });

                              },

                              child: Draggable<int>(
                                data: 1,
                                child: Box_container(FontAwesomeIcons.box, Colors.blueAccent, 30),
                                feedback: Box_container(FontAwesomeIcons.box, Colors.blueAccent, 30),

                              ),
                            )
                            ),
                          ],
                        ),
                        //Expanded(child: Background_cards(Colors.white54, Center(child: Text('Each box cannot be dragged more than once.', style: Card_text,)))),



                      ],

                    )
                )
            ),
            Expanded(
                flex: 10,
                child: Background_cards(background_card_color,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: Text(' Transmission Packets! ', style: Player_text,)),
                        Row(
                          children: [
                        Expanded(

                          child: DragTarget<int>(
                              builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                  ) {
                                return Data_packet(player_card_color, icon,color,color2, color3, icon2,icon3);
                              },
                              onAccept: (int data) {
                                setState(() {
                                  packet_1=true;
                                  packet_2=false;
                                  packet_3=false;
                                  if (packet_1==true)
                                    {
                                      if(red_state==true){
                                        count_red+=1;
                                      }
                                      else if(green_state==true)
                                        {
                                          count_green+=1;
                                        }
                                      else if(blue_state==true)
                                        {
                                          count_blue+=1;
                                        }
                                      icon=FontAwesomeIcons.box;
                                      bool value_red1=state.alert_giver_red(count_red);
                                      bool value_green1=test.alert_giver_green(count_green);
                                      bool value_blue1=state.alert_giver_blue(count_blue);
                                      Color color_from_state1 = state.color_check_transmission_icons(value_red1, value_green1, value_blue1, red_state, blue_state, green_state);
                                      if (color_from_state1 == Colors.red){
                                        color = color_from_state1;
                                        A_data1=1;
                                        A_t_1=1;
                                      }
                                      else if (color_from_state1 == Colors.green){
                                        color2 = color_from_state1;
                                        B_data1=1;
                                        B_t_1=1;
                                      }
                                      else if (color_from_state1 == Colors.blue){
                                        color3 = color_from_state1;
                                        C_data1=1;
                                        C_t_1=1;
                                      }


                                    }


                                });
                              },






                          ),
                        ),

                        IconButton(
                        iconSize: 30,
                        color: Colors.red,
                        icon: const Icon(FontAwesomeIcons.minusCircle,
                        ),

                        onPressed: () {
                        setState(() {
                          if (A_data1==1){
                            color=Colors.transparent;
                            count_red=0;
                            A_t_1=0;
                          }
                          if(B_data1==1){
                            color2=Colors.transparent;
                            count_green=0;
                            B_t_1=0;
                          }
                          if(C_data1==1){
                            color3=Colors.transparent;
                            count_blue=0;
                            C_t_1=0;
                          }






                        });
                        },
                        ),


                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child:

                                DragTarget<int>(
                              builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                  ) {
                                return Data_packet(player_card_color, icon,color2_red,color2_green, color2_blue, icon2,icon3);
                              },
                              onAccept: (int data) {
                                setState(() {
                                packet_1=false;
                                packet_2=true;
                                packet_3=false;
                                if (packet_2==true)
                                {
                                   if(red_state==true){
                                      count_red2+=1;
                                   }
                                  else if(green_state==true)
                                  {
                                       count_green2+=1;
                                    }
                                  else if(blue_state==true)
                                   {
                                        count_blue2+=1;
                                   }
                                   icon=FontAwesomeIcons.box;
                                   bool value_red=state.alert_giver_red(count_red2);
                                   bool value_green=test.alert_giver_green(count_green2);
                                   bool value_blue=state.alert_giver_blue(count_blue2);
                                   Color color_from_state = state.color_check_transmission_icons(value_red, value_green, value_blue, red_state, blue_state, green_state);
                                   if (color_from_state == Colors.red){
                                     color2_red = color_from_state;
                                     A_data2=1;
                                     A_t_2=1;
                                   }
                                   else if (color_from_state == Colors.green){
                                     color2_green = color_from_state;
                                     B_data2=1;
                                     B_t_2=1;
                                   }
                                   else if (color_from_state == Colors.blue){
                                     color2_blue = color_from_state;
                                     C_data2=1;
                                     C_t_2=1;
                                   }

                                }





                                });
                              },



                            )),

                            IconButton(
                            iconSize: 30,
                            color: Colors.red,
                            icon: const Icon(FontAwesomeIcons.minusCircle,
                            ),

                            onPressed: () {
                            setState(() {
                              if (A_data2==1){
                                color2_red=Colors.transparent;
                                count_red2=0;
                                A_t_2=0;
                              }
                              if(B_data2==1){
                                color2_green=Colors.transparent;
                                count_green2=0;
                                B_t_2=0;
                              }
                              if(C_data2==1){
                                color2_blue=Colors.transparent;
                                count_blue2=0;
                                C_t_2=0;
                              }




                            });
                            },
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child:  DragTarget<int>(
                              builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                  ) {
                                return Data_packet(player_card_color, icon,color3_red,color3_green, color3_blue, icon2,icon3);
                              },
                              onAccept: (int data) {
                                setState(() {
                                  packet_1=false;
                                  packet_2=false;
                                  packet_3=true;
                                  if(packet_3==true)
                                    {
                                      if(red_state==true){
                                        count_red3+=1;
                                      }
                                      else if(green_state==true)
                                      {
                                        count_green3+=1;
                                      }
                                      else if(blue_state==true)
                                      {
                                        count_blue3+=1;
                                      }
                                      icon=FontAwesomeIcons.box;
                                      bool value_red3=state.alert_giver_red(count_red3);
                                      bool value_green3=test.alert_giver_green(count_green3);
                                      bool value_blue3=state.alert_giver_blue(count_blue3);
                                      Color color_from_state3 = state.color_check_transmission_icons(value_red3, value_green3, value_blue3, red_state, blue_state, green_state);
                                      if (color_from_state3 == Colors.red){
                                        color3_red = color_from_state3;
                                        A_data=1;
                                        A_t_3=1;
                                      }
                                      else if (color_from_state3 == Colors.green){
                                        color3_green = color_from_state3;
                                        B_data=1;
                                        B_t_3=1;
                                      }
                                      else if (color_from_state3 == Colors.blue){
                                        color3_blue = color_from_state3;
                                        C_data=1;
                                        C_t_3=1;

                                      }

                                    }




                                });
                              },



                            )),

                            IconButton(
                            iconSize: 30,
                            color: Colors.red,
                            icon: const Icon(FontAwesomeIcons.minusCircle,
                            ),

                            onPressed: () {
                            setState(() {
                              if (A_data==1){
                                color3_red=Colors.transparent;
                                count_red3=0;
                                A_t_3=0;
                               }
                              if(B_data==1){
                                color3_green=Colors.transparent;
                                count_green3=0;
                                B_t_3=0;
                              }
                              if(C_data==1){
                                color3_blue=Colors.transparent;
                                count_blue3=0;
                                C_t_3=0;
                              }

                            }

                            );
                            },
                            ),
                          ],
                        ),




                        Center(child: Text('Players and Items!', style: Player_text,)),
                        // Expanded(
                        //   child:  Player_container_edited(player_card1,FontAwesomeIcons.ghost, Colors.red,45),
                        // ),
                        // Expanded(
                        //   child:  Player_container_edited(player_card2,FontAwesomeIcons.ghost, Colors.green, 45 ),
                        //
                        // ),
                        // Expanded(
                        //   child:  Player_container_edited(player_card3,FontAwesomeIcons.ghost, Colors.blue, 45 ),
                        //
                        //
                        // ),

                        Expanded(
                          flex: 8,
                            child: Background_cards(Colors.white54, Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,

                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,


                                  children: [
                                    SizedBox(
                                      height: 40,

                                    ),
                                    Expanded(child: Center(child: Container(child: Text('Player', style: Item_text)))),
                                    Expanded(child: Center(child: Container(child: Text('Player Wants', style: Item_text)))),
                                    Expanded(child: Center(child: Container(child: Text('Player Has', style: Item_text)))),
                                  ],

                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child:  Player_container_edited(player_card1,FontAwesomeIcons.ghost, Colors.red,45),
                                    ),
                                    Expanded(
                                      flex: 4,
                                        child: Box_container(FontAwesomeIcons.box, Colors.red, 30)),
                                    SizedBox(
                                      width: 55,
                                    ),

                                    Expanded(child: Box_container(FontAwesomeIcons.box, red_box1, 30)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Box_container(FontAwesomeIcons.box, red_box2, 30)),
                                    SizedBox(
                                      width: 20,
                                    )


                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex:4,
                                      child:  Player_container_edited(player_card2,FontAwesomeIcons.ghost, Colors.green, 45 ),

                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Box_container(FontAwesomeIcons.box, Colors.green, 30)),
                                    SizedBox(
                                      width: 55,
                                    ),

                                    Expanded(child: Box_container(FontAwesomeIcons.box, green_box1, 30)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Box_container(FontAwesomeIcons.box, green_box2, 30)),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex:4,
                                      child:  Player_container_edited(player_card3,FontAwesomeIcons.ghost, Colors.blue, 45 ),


                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Box_container(FontAwesomeIcons.box, Colors.blue, 30)),
                                    SizedBox(
                                      width: 55,
                                    ),

                                    Expanded(child: Box_container(FontAwesomeIcons.box, blue_box1, 30)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Box_container(FontAwesomeIcons.box, blue_box2, 30)),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),


                                // Expanded(child: Container(child: Text('Wants', style: Item_text))),
                                // Expanded(child: Container(child: Text('Has', style: Item_text))),
                                // Expanded(child: Container(child: Text('Red player has $red_player_box and wants $check1.', style: Item_text))),
                                // Expanded(child: Container(child: Text('Green player has $green_player_box and wants $check2.', style: Item_text))),
                                // Expanded(child: Container(child: Text('Blue player has $blue_player_box and wants $check3.', style: Item_text))),


                              ],
                            ))),
                      ],

                    )),),
            // Main internal work
            Expanded(
              flex: 2,

              child: Bottom_app_bar(Color(0xffda2c43),
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Screen3(image_link,result,result_description)),
                    );
                    setState(() {
                      // checking if the user has selected player1/ player2/ player3




                        if(red_player_box=='Green and Blue boxes')
                          // checking the values of what they have for each player/
                          {
                            arr1_red=[0.0,1.0,0.0];
                            arr2_red=[0.0,0.0,1.0];

                          }
                        else{
                          arr1_red= box_check.get_box_values(red_player_box);
                          arr2_red=[0.0,0.0,0.0];
                        }




                          if(green_player_box=='Red and Blue boxes')
                          {
                            arr1_green=[0.0,1.0,0.0];
                            arr2_green=[0.0,0.0,1.0];

                          }
                          else{
                            arr1_green= box_check.get_box_values(green_player_box);
                            arr2_green=[0.0,0.0,0.0];
                          }



                        if(blue_player_box=='Red and Green boxes')
                        {
                          arr1_blue=[0.0,1.0,0.0];
                          arr2_blue=[0.0,0.0,1.0];

                        }
                        else{
                          arr1_blue= box_check.get_box_values(blue_player_box);
                          arr2_blue=[0.0,0.0,0.0];
                        }
                        // defining the matrices of each reciever

                        var red_player_matrix=GaussJordan.solve([[A_t_1,B_t_1,C_t_1],[A_t_2,B_t_2,C_t_2],[A_t_3,B_t_3,C_t_3],arr1_red, arr2_red]);
                        var green_player_matrix=GaussJordan.solve([[A_t_1,B_t_1,C_t_1],[A_t_2,B_t_2,C_t_2],[A_t_3,B_t_3,C_t_3],arr1_green, arr2_green]);
                        var blue_player_matrix=GaussJordan.solve([[A_t_1,B_t_1,C_t_1],[A_t_2,B_t_2,C_t_2],[A_t_3,B_t_3,C_t_3],arr1_blue, arr2_blue]);

                        // this is the fitting matrix for the best solution

                     var fitting_matrix= list2_array2d.fitting_matrix_preform([1.0, 0.0,0.0],[0.0, 1.0,0.0],[0.0,0.0,1.0], red_player_box, green_player_box, blue_player_box);
                     // getting the star count of the matrix

                     star_count= list2_array2d.star_count(fitting_matrix);
                     // getting the total test number
                     total_test_count=pow(2, star_count).toInt();
                     print('total number of tests $total_test_count');
                     var s_matrix= list2_array2d.s_matrix(2, star_count, fitting_matrix);
                     print(s_matrix);

                      min_rank=list2_array2d.min_rank_finder(star_count, total_test_count, s_matrix, fitting_matrix);
                      print('matrix min rank $min_rank');




                      //finding RREF

                      //calculating modulo 2
                      int count_rows=5;
                      int count_cols=3;

                      //finding the mod2 of the matrices
                      red_player_matrix= matrix_result.mod2_finder(red_player_matrix, count_rows, count_cols);
                      green_player_matrix=matrix_result.mod2_finder(green_player_matrix, count_rows, count_cols);
                      blue_player_matrix=matrix_result.mod2_finder(blue_player_matrix, count_rows, count_cols);
                      print(red_player_matrix);
                      print(green_player_matrix);
                      print(blue_player_matrix);
                       //Array2d form of the original matrix
                      var red_player_2darr= list2_array2d.conversion_from(red_player_matrix);
                      var green_player_2darr=list2_array2d.conversion_from(green_player_matrix);
                      var blue_player_2darr=list2_array2d.conversion_from(blue_player_matrix);


                     // looking for the position of  pivot of red matrix
                      for(int i=0; i<count_rows;i++){
                        for(int j=0;j<count_cols; j++)
                        {
                          if(red_player_matrix[i][j]==0)
                          {
                            continue;

                          }
                          else{


                                if(pivot.pivot_position_finder(i, j)=='Red box')
                                  {
                                    red_pivot_row_number=i;
                                    red_player_matrix[i][j]=0;
                                    red_pivot=1;

                                  }


                          }
                        }}

                        for(int i=0; i<count_rows;i++){
                          for(int j=0;j<count_cols; j++)
                          {
                            if(green_player_matrix[i][j]==0)
                            {
                              continue;

                            }
                            else{


                              if(pivot.pivot_position_finder(i, j)=='Green box')
                              {
                                green_pivot_row_number=i;
                                green_player_matrix[i][j]=0;

                                green_pivot=1;

                              }



                            }
                          }}
                        for(int i=0; i<count_rows;i++){
                          for(int j=0;j<count_cols; j++)
                          {
                            if(blue_player_matrix[i][j]==0)
                            {
                              continue;

                            }
                            else{


                              if(pivot.pivot_position_finder(i, j)=='Blue box')
                              {
                                blue_pivot_row_number=i;
                                blue_player_matrix[i][j]=0;

                                blue_pivot=1;

                              }

                            }
                          }}
                        // print(red_player_matrix);
                        // print(green_player_matrix);
                        // print(blue_player_matrix);
                        // further checkup of the pivots of all matrices

                      if(red_pivot==1)
                        {
                          for(int j=0; j<count_cols;j++)
                          {
                            if (red_player_matrix[red_pivot_row_number][j]!=0){
                              print(red_player_matrix[red_pivot_row_number][j]);
                              red_pivot_further=1;
                              break;

                            }
                            else{
                              red_pivot_further=2;
                            }
                          }


                        }
                      if(green_pivot==1)
                      {
                        for(int j=0; j<count_cols;j++)
                        {
                          if (green_player_matrix[green_pivot_row_number][j]!=0){
                            green_pivot_further=1;
                            break;

                          }
                          else{
                            green_pivot_further=2;
                          }
                        }


                      }
                       if(blue_pivot==1)
                      {
                        for(int j=0; j<count_cols;j++)
                        {
                          if (blue_player_matrix[blue_pivot_row_number][j]!=0){
                            blue_pivot_further=1;
                            break;

                          }
                          else{
                            blue_pivot_further=2;
                          }
                        }


                      }
                      print([red_pivot_further, green_pivot_further, blue_pivot_further]);
                       // From transmission screen, packet count
                        design1=matrix_result.design_count(A_t_1.toInt(), B_t_1.toInt(), C_t_1.toInt());
                        design2=matrix_result.design_count(A_t_2.toInt(), B_t_2.toInt(), C_t_2.toInt());
                        design3=matrix_result.design_count(A_t_3.toInt(), B_t_3.toInt(), C_t_3.toInt());
                        total_design= design1+design2+design3;
                        print('total design $total_design');


                      //Result screen
                      //finally setting up and passing data for screen3

                        if(red_pivot_further==2 && green_pivot_further==2 && blue_pivot_further==2)
                          {
                            if (total_design==min_rank)
                              {
                                image_link='https://media.giphy.com/media/l2JdVRfJozpjq70SA/giphy.gif';
                                result='Congratulations!';
                                result_description='All players have successfully got the box.';

                              }
                            else
                              {
                                image_link='https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif';
                                result='Good job!';
                                result_description='Your solution is good, but it is not the best. Try again!';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Screen4(image_link,result,result_description)),
                                );

                              }

                          }
                        else{
                          image_link='https://media.giphy.com/media/BEob5qwFkSJ7G/giphy.gif';
                          result='Sorry!';
                          result_description='All of the players did not get the box.';

                        }


                    });

                  }, child: Text('Transmit Now!',style: Button_bottom_text,),


              )),
            )



          ],
        )
    );
  }
}



