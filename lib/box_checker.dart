// This class is for getting the side information of the players

class Box_check_for_player{

  List<double> get_box_values(String value)
  {
    List<double> arr1=[0,0,0];


    if (value=='Red box'){
      arr1= [1.0,0.0,0.0];



    }
    else if(value=='Blue box')
    {
      arr1=[0.0,0.0,1.0];

      return arr1 ;
    }
    else if (value=='Green box')
    {
      arr1=[0.0,1.0,0.0];


    }

    else{

    }
    return arr1;


  }
}