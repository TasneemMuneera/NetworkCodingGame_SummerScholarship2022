
//creating for the conversion
// everything related to fitting matrix
import 'dart:math';
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';
import 'package:matrix2d/matrix2d.dart';
import 'package:extended_math/extended_math.dart';
import 'package:binary/binary.dart';

class List2_Array2d{

  Array2d conversion_from(var test )
  {
    List a= test.sublist(0,1);
    List b= test.sublist(1,2);
    List c= test.sublist(2,3);
    List d=test.sublist(3,4);
    List e =test.sublist(4,5);
    a=a.flatten;
    b=b.flatten;
    c=c.flatten;
    d=d.flatten;
    e=e.flatten;
    List<double> new_a = new List<double>.from(a);
    List<double> new_b = new List<double>.from(b);
    List<double> new_c = new List<double>.from(c);
    List<double> new_d = new List<double>.from(d);
    List<double> new_e = new List<double>.from(e);
    var matrix = Array2d.empty();


    matrix.add(Array(new_a));
    matrix.add(Array(new_b));
    matrix.add(Array(new_c));
    matrix.add(Array(new_d));
    matrix.add(Array(new_e));

    return matrix;



  }
  Array2d fitting_matrix_preform(var list1, var list2, var list3, String red_player_box, String green_player_box, String blue_player_box )
   {//assign fitting matrix

    var matrix = Array2d.empty();
    if(red_player_box=='Blue box')
      {
        list1[2]=2.0;
      }
    else if (red_player_box=='Green box')
      {
        list1[1]=2.0;

      }
    else if (red_player_box=='Green and Blue boxes')
    {

      list1[1]=2.0;
      list1[2]=2.0;

    }
    else{

    }
    matrix.add(Array(list1));

     if(green_player_box=='Red box')
      {
        list2[0]=2.0;
      }
    else if(green_player_box=='Blue box')
    {
      list2[2]=2.0;
    }
    else if(green_player_box=='Red and Blue boxes')
    {
      list2[0]=2.0;
      list2[2]=2.0;
    }
    else{

     }
    matrix.add(Array(list2));
     if(blue_player_box=='Red box')
    {
      list3[0]=2.0;

    }
    else if(blue_player_box=='Green box')
    {
      list3[1]=2.0;

    }
    else if(blue_player_box=='Red and Green boxes')
    {
      list3[0]=2.0;
      list3[1]=2.0;

    }
    else {

     }


    matrix.add(Array(list3));




    return matrix;

  }
  // getting the star count
int star_count(Array2d fitting_matrix)
{
  int star_count=0;
  for (int i=0; i<3;i++)
  {
    for(int j=0; j<3;j++)
    {
      if (fitting_matrix[i][j]==2)
      {
        star_count+=1;

      }
    }
  }

  return star_count;

}
Array2d s_matrix(int row, int cols, Array2d fitting_matrix)
{
  var s_matrix= Array2d.empty();
  for (int i=0; i<3;i++)
  {
    for(int j=0; j<3;j++)
    {
      if (fitting_matrix[i][j]==2)
      {
        s_matrix.add(Array([i.toDouble(),j.toDouble()]));


      }
    }
  }
  return s_matrix;



}
int min_rank_finder(int star_count, int total_test_count, Array2d s_matrix, Array2d m_matrix)
{
  int min_rank=9999;
  int matrix_rank=0;


  for(int i=0;i <total_test_count; i++)
    {

          // processing the desired padded binary
          String a= i.toBinaryPadded(star_count);
          var binary_arr= Array.empty();
          //check is the binary splitting array
          var check= a.split("");


          for(int j=0;j<check.length;j++)
          {
            String n= check[j];
            binary_arr.add(double.parse(n));
          }
          //print(binary_arr);
          for(int k=0; k<star_count;k++)
            {
              int r_value= (s_matrix[k][0]).toInt();
              int c_value= (s_matrix[k][1]).toInt();
              m_matrix[r_value][c_value]=binary_arr[k];
            }
          matrix_rank= SVD(m_matrix).rank();
          if(matrix_rank<min_rank)
            {
              min_rank=matrix_rank;
            }






    }
 return min_rank;




}

}
