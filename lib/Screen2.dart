import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scidart/numdart.dart';
import 'package:ss_test/bottom_app_bar.dart';
import 'package:ss_test/pivot_data_check.dart';
import 'package:ss_test/constants.dart';
import 'package:ss_test/screen3.dart';
import 'background_cards.dart';
import 'player_containers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'item_dialogue_box.dart';
import'package:ss_test/Player_container_edited.dart';
import 'data_packet.dart';
import 'state_checker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'test.dart';
import 'package:gauss_jordan/gauss_jordan.dart';
import "dart:math";
import 'package:scidart/scidart.dart';
import 'package:matrix2d/matrix2d.dart';
import 'package:extended_math/extended_math.dart';
import 'mtrix2array.dart';
import 'package:binary/binary.dart';


State_checker state= State_checker();
Green test=Green();
Pivot_data_check pivot= Pivot_data_check();
List2_Array2d list2_array2d= List2_Array2d();



T getRandomElement<T>(List<T> box_names) {
  final random = new Random();
  var i = random.nextInt(box_names.length);
  return box_names[i];
}
// T getRandomboxes<T>(List<T> box_names) {
//   final random = new Random();
//   var i = random.nextInt(box_names.length);
//   return box_names[i];
// }
// generating the boxes each player wants




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
  // side information arrays
  List<double> arr1=[0,0,0];
  List<double> arr2=[0,0,0];


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
  // user_matrix rank
  int matrix_rank=0;





  @override
  Widget build(BuildContext context) {


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
                                  child: Player_container(FontAwesomeIcons.box, Colors.red,30 ),
                                  feedback: Player_container(FontAwesomeIcons.box, Colors.red,30 ) ,
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
                                  child:  Player_container(FontAwesomeIcons.box, Colors.green, 30),
                                  feedback: Player_container(FontAwesomeIcons.box, Colors.green, 30),
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
                                child: Player_container(FontAwesomeIcons.box, Colors.blueAccent, 30),
                                feedback: Player_container(FontAwesomeIcons.box, Colors.blueAccent, 30),

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
                                      Color color_from_state1 = state.state_check1(value_red1, value_green1, value_blue1, red_state, blue_state, green_state);
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
                                   Color color_from_state = state.state_check1(value_red, value_green, value_blue, red_state, blue_state, green_state);
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
                                      Color color_from_state3 = state.state_check1(value_red3, value_green3, value_blue3, red_state, blue_state, green_state);
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






                        Expanded(
                          flex: 8,
                            child: Background_cards(Colors.white54, Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,

                              children: [
                                Center(child: Text('Tap to select Players!', style: Player_text,)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child:  GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              player_card1=player_selection_color;
                                              player_card2=Colors.transparent;
                                              player_card3=Colors.transparent;
                                            });
                                          },
                                          child: Player_container_edited(player_card1,FontAwesomeIcons.ghost, Colors.red,45)),
                                    ),
                                    Expanded(
                                      child:  GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              player_card1=Colors.transparent;
                                              player_card2=player_selection_color;
                                              player_card3=Colors.transparent;
                                            });
                                          },
                                          child: Player_container_edited(player_card2,FontAwesomeIcons.ghost, Colors.green, 45 )),

                                    ),
                                    Expanded(
                                      child:  GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              player_card1=Colors.transparent;
                                              player_card2=Colors.transparent;
                                              player_card3=player_selection_color;
                                            });
                                          },
                                          child: Player_container_edited(player_card3,FontAwesomeIcons.ghost, Colors.blue, 45 )),


                                    ),


                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(child: Container(child: Text('Red player has $red_player_box and wants $check1.', style: Item_text))),
                                Expanded(child: Container(child: Text('Green player has $green_player_box and wants $check2.', style: Item_text))),
                                Expanded(child: Container(child: Text('Blue player has $blue_player_box and wants $check3.', style: Item_text))),


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


                      if (player_card1==player_selection_color){

                        if(red_player_box=='Green and Blue boxes')
                          // checking the values of what they have for each player/
                          {
                            arr1=[0.0,1.0,0.0];
                            arr2=[0.0,0.0,1.0];

                          }
                        else{
                          arr1= box_check.get_box_values(red_player_box);
                          arr2=[0.0,0.0,0.0];
                        }

                      }
                      else if (player_card2==player_selection_color)
                        {
                          if(green_player_box=='Red and Blue boxes')
                          {
                            arr1=[0.0,1.0,0.0];
                            arr2=[0.0,0.0,1.0];

                          }
                          else{
                            arr1= box_check.get_box_values(green_player_box);
                            arr2=[0.0,0.0,0.0];
                          }
                        }
                      else if (player_card3==player_selection_color)
                      {
                        if(blue_player_box=='Red and Green boxes')
                        {
                          arr1=[0.0,1.0,0.0];
                          arr2=[0.0,0.0,1.0];

                        }
                        else{
                          arr1= box_check.get_box_values(blue_player_box);
                          arr2=[0.0,0.0,0.0];
                        }
                      }

                      var test=GaussJordan.solve([[A_t_1,B_t_1,C_t_1],[A_t_2,B_t_2,C_t_2],[A_t_3,B_t_3,C_t_3],arr1, arr2]);
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


                       for(int i=0; i<count_rows;i++){
                         for(int j=0;j<count_cols;j++){
                           test[i][j]= (test[i][j])%2;


                         }
                       }
                       //Array2d form of the original matrix
                      var test2= list2_array2d.conversion_from(test);
                       print(test);
                      print(test2);

                      //print(SVD(test2).rank());
                      //print(test2.diagonal);

                     // looking for the position of  pivot
                      for(int i=0; i<count_rows;i++){
                        for(int j=0;j<count_cols; j++)
                        {
                          if(test[i][j]==0)
                          {
                            continue;

                          }
                          else{

                            if(player_card1==player_selection_color)
                              {
                                if(pivot.pivot_position_finder(i, j)=='Red box')
                                  {
                                    red_pivot_row_number=i;
                                    test[i][j]=0;
                                    red_pivot=1;

                                  }


                              }
                            else if(player_card2==player_selection_color)
                            {
                              if(pivot.pivot_position_finder(i, j)=='Green box')
                              {
                                green_pivot_row_number=i;
                                test[i][j]=0;

                                green_pivot=1;

                              }


                            }
                            else if(player_card3==player_selection_color)
                            {
                              if(pivot.pivot_position_finder(i, j)=='Blue box')
                              {
                                blue_pivot_row_number=i;
                                test[i][j]=0;

                                blue_pivot=1;

                              }


                            }
                            else{

                            }
                          }
                        }}

                      if(red_pivot==1)
                        {
                          for(int j=0; j<count_cols;j++)
                          {
                            if (test[red_pivot_row_number][j]!=0){
                              print(test[red_pivot_row_number][j]);
                              red_pivot_further=1;
                              break;

                            }
                            else{
                              red_pivot_further=2;
                            }
                          }


                        }
                      else if(green_pivot==1)
                      {
                        for(int j=0; j<count_cols;j++)
                        {
                          if (test[green_pivot_row_number][j]!=0){
                            green_pivot_further=1;
                            break;

                          }
                          else{
                            green_pivot_further=2;
                          }
                        }


                      }
                      else if(blue_pivot==1)
                      {
                        for(int j=0; j<count_cols;j++)
                        {
                          if (test[blue_pivot_row_number][j]!=0){
                            blue_pivot_further=1;
                            break;

                          }
                          else{
                            blue_pivot_further=2;
                          }
                        }


                      }
                      //Result screen
                      matrix_rank= SVD(test2).rank();
                      print('original matrix rank $matrix_rank');
                      //finally setting up and passing data for screen3
                      if(player_card1==player_selection_color)
                      {
                        if(red_pivot_further==2)
                          {
                            if (matrix_rank==min_rank)
                              {
                                image_link='https://media.giphy.com/media/l2JdVRfJozpjq70SA/giphy.gif';
                                result='Congratulations!';
                                result_description='Your player has successfully got the box.';

                              }
                            else
                              {
                                image_link='https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif';
                                result='Good job!';
                                result_description='Your solution is good, but it is not the best. Try again!';

                              }

                          }
                        else{
                          image_link='https://media.giphy.com/media/BEob5qwFkSJ7G/giphy.gif';
                          result='Sorry!';
                          result_description='Your player did not get the box.';

                        }


                      }
                      else if(player_card2==player_selection_color)
                      {
                        if(green_pivot_further==2)
                        {
                          if (matrix_rank==min_rank)
                          {
                            image_link='https://media.giphy.com/media/l2JdVRfJozpjq70SA/giphy.gif';
                            result='Congratulations!';
                            result_description='Your player has successfully got the box.';

                          }
                          else
                          {
                            image_link='https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif';
                            result='Good job!';
                            result_description='Your solution is good, but it is not the best. Try again!';

                          }
                        }
                        else{
                          image_link='https://media.giphy.com/media/BEob5qwFkSJ7G/giphy.gif';
                          result='Sorry!';
                          result_description='Your player did not get the box.';

                        }



                      }
                      else if(player_card3==player_selection_color)
                      {
                        if(blue_pivot_further==2)
                        {
                          if (matrix_rank==min_rank)
                          {
                            image_link='https://media.giphy.com/media/l2JdVRfJozpjq70SA/giphy.gif';
                            result='Congratulations!';
                            result_description='Your player has successfully got the box.';

                          }
                          else
                          {
                            image_link='https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif';
                            result='Good job!';
                            result_description='Your solution is good, but it is not the best. Try again!';

                          }
                        }
                        else{
                          image_link='https://media.giphy.com/media/BEob5qwFkSJ7G/giphy.gif';
                          result='Sorry!';
                          result_description='Your player did not get the box.';

                        }



                      }
                      else{

                          image_link='https://media.giphy.com/media/EX6wKXVM9IOlO/giphy.gif';
                          result='Oops!';
                          result_description='You did not select any player. Start over or go back to select a player.';

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



