public class DayofMonth {
  int[] DayofMonth_list;
  int D_One;
  int D_Two;
  int D_Three;
  int D_Four;
  int D_Five;
  int D_Six;
  int D_Seven;
  int D_Eight;
  int D_Nine;
  int D_Ten;
  int D_Eleven;
  int D_Twelve;
  int D_Thirteen;
  int D_Fourteen;
  int D_Fifteen;
  int D_Sixteen;
  int D_Seventeen;
  int D_Eighteen;
  int D_Nineteen;
  int D_Twenty;
  int D_Twenty_one;
  int D_Twenty_two;
  int D_Twenty_three;
  int D_Twenty_four;
  int D_Twenty_five;
  int D_Twenty_six;
  int D_Twenty_seven;
  int D_Twenty_eight;
  int D_Twenty_nine;
  int D_Thirty;
  int D_Thirty_one;
  
  public DayofMonth() {
    DayofMonth_list = new int[31];
  }
  
  public int[] CountDayofMonth(String[][] dayofmonth) {
    for (int m = 0; m < dayofmonth.length; m++) {
      if (dayofmonth[m][1].substring(8, 10).equals("01")) {
        D_One++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("02")) {
        D_Two++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("03")) {
        D_Three++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("04")) {
        D_Four++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("05")) {
        D_Five++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("06")) {
        D_Six++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("07")) {
        D_Seven++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("08")) {
        D_Eight++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("09")) {
        D_Nine++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("10")) {
        D_Ten++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("11")) {
        D_Eleven++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("12")) {
        D_Twelve++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("13")) {
        D_Thirteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("14")) {
        D_Fourteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("15")) {
        D_Fifteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("16")) {
        D_Sixteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("17")) {
        D_Seventeen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("18")) {
        D_Eighteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("19")) {
        D_Nineteen++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("20")) {
        D_Twenty++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("21")) {
        D_Twenty_one++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("22")) {
        D_Twenty_two++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("23")) {
        D_Twenty_three++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("24")) {
        D_Twenty_four++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("25")) {
        D_Twenty_five++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("26")) {
        D_Twenty_six++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("27")) {
        D_Twenty_seven++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("28")) {
        D_Twenty_eight++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("29")) {
        D_Twenty_nine++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("30")) {
        D_Thirty++;
      }
      if (dayofmonth[m][1].substring(8, 10).equals("31")) {
        D_Thirty_one++;
      }
    } //End of for loop
    DayofMonth_list[0] = D_One;
    DayofMonth_list[1] = D_Two;
    DayofMonth_list[2] = D_Three;
    DayofMonth_list[3] = D_Four;
    DayofMonth_list[4] = D_Five;
    DayofMonth_list[5] = D_Six;
    DayofMonth_list[6] = D_Seven;
    DayofMonth_list[7] = D_Eight;
    DayofMonth_list[8] = D_Nine;
    DayofMonth_list[9] = D_Ten;
    DayofMonth_list[10] = D_Eleven;
    DayofMonth_list[11] = D_Twelve;
    DayofMonth_list[12] = D_Thirteen;
    DayofMonth_list[13] = D_Fourteen;
    DayofMonth_list[14] = D_Fifteen;
    DayofMonth_list[15] = D_Sixteen;
    DayofMonth_list[16] = D_Seventeen;
    DayofMonth_list[17] = D_Eighteen;
    DayofMonth_list[18] = D_Nineteen;
    DayofMonth_list[19] = D_Twenty;
    DayofMonth_list[20] = D_Twenty_one;
    DayofMonth_list[21] = D_Twenty_two;
    DayofMonth_list[22] = D_Twenty_three;
    DayofMonth_list[23] = D_Twenty_four;
    DayofMonth_list[24] = D_Twenty_five;
    DayofMonth_list[25] = D_Twenty_six;
    DayofMonth_list[26] = D_Twenty_seven;
    DayofMonth_list[27] = D_Twenty_eight;
    DayofMonth_list[28] = D_Twenty_nine;
    DayofMonth_list[29] = D_Thirty;
    DayofMonth_list[30] = D_Thirty_one;
    return DayofMonth_list;
  }
  
}
