import 'dart:math';

class Matrix_result_calculation{

  List<List<double>> mod2_finder(List<List<double>> red_player_matrix, int count_rows, int count_cols)
  {
    for(int i=0; i<count_rows;i++){
      for(int j=0;j<count_cols;j++){
        red_player_matrix[i][j]= (red_player_matrix[i][j])%2;


      }
    }
    return red_player_matrix;
  }
  // finding the number of designs transmission
  //this this needed for comparing the rank of the matrix

int design_count(int a, int b, int c)
{
  int design=0;
  if(a==1 ||b==1 || c==1)
  {
    design=1;

  }
  return design;
}
}