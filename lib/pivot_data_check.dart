class Pivot_data_check
{


  String pivot_position_finder(int i_value, int j_value)
  {
    if(i_value==0 && j_value==0)
      {
        return ('Red box');
      }
    else if (i_value==1 && j_value==0)
      {
        return('Red box');
      }
    else if (i_value==2 && j_value==0)
    {
      return('Red box');
    }
    else if (i_value==3 && j_value==0)
    {
      return('Red box');
    }
    else if (i_value==4 && j_value==0)
    {
      return('Red box');
    }
    else if (i_value==0 && j_value==1)
    {
      return('Green box');
    }
    else if (i_value==1 && j_value==1)
    {
      return('Green box');
    }
    else if (i_value==2 && j_value==1)
    {
      return('Green box');
    }
    else if (i_value==3 && j_value==1)
    {
      return('Green box');
    }
    else if (i_value==4 && j_value==1)
    {
      return('Green box');
    }
    else if (i_value==0 && j_value==2)
    {
      return('Blue box');
    }
    else if (i_value==1 && j_value==2)
    {
      return('Blue box');
    }
    else if (i_value==2 && j_value==2)
    {
      return('Blue box');
    }
    else if (i_value==3 && j_value==2)
    {
      return('Blue box');
    }
    else if (i_value==4 && j_value==2)
    {
      return('Blue box');
    }
    else{
      return ('no pivot here');
    }



  }

}