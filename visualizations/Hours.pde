public class Hours {
  int[] Hours_list;
  int H_Zero;
  int H_One;
  int H_Two;
  int H_Three;
  int H_Four;
  int H_Five;
  int H_Six;
  int H_Seven;
  int H_Eight;
  int H_Nine;
  int H_Ten;
  int H_Eleven;
  int H_Twelve;
  int H_Thirteen;
  int H_Fourteen;
  int H_Fifteen;
  int H_Sixteen;
  int H_Seventeen;
  int H_Eighteen;
  int H_Nineteen;
  int H_Twenty;
  int H_Twenty_one;
  int H_Twenty_two;
  int H_Twenty_three;
  
  public Hours() {
    Hours_list = new int[24];
  }
  
  public int[] CountHours(String[][] hours) {
    for (int m = 0; m < hours.length; m++) {
      if (hours[m][1].substring(11, 13).equals("00")) {
        H_Zero++;
      }
      if (hours[m][1].substring(11, 13).equals("01")) {
        H_One++;
      }
      if (hours[m][1].substring(11, 13).equals("02")) {
        H_Two++;
      }
      if (hours[m][1].substring(11, 13).equals("03")) {
        H_Three++;
      }
      if (hours[m][1].substring(11, 13).equals("04")) {
        H_Four++;
      }
      if (hours[m][1].substring(11, 13).equals("05")) {
        H_Five++;
      }
      if (hours[m][1].substring(11, 13).equals("06")) {
        H_Six++;
      }
      if (hours[m][1].substring(11, 13).equals("07")) {
        H_Seven++;
      }
      if (hours[m][1].substring(11, 13).equals("08")) {
        H_Eight++;
      }
      if (hours[m][1].substring(11, 13).equals("09")) {
        H_Nine++;
      }
      if (hours[m][1].substring(11, 13).equals("10")) {
        H_Ten++;
      }
      if (hours[m][1].substring(11, 13).equals("11")) {
        H_Eleven++;
      }
      if (hours[m][1].substring(11, 13).equals("12")) {
        H_Twelve++;
      }
      if (hours[m][1].substring(11, 13).equals("13")) {
        H_Thirteen++;
      }
      if (hours[m][1].substring(11, 13).equals("14")) {
        H_Fourteen++;
      }
      if (hours[m][1].substring(11, 13).equals("15")) {
        H_Fifteen++;
      }
      if (hours[m][1].substring(11, 13).equals("16")) {
        H_Sixteen++;
      }
      if (hours[m][1].substring(11, 13).equals("17")) {
        H_Seventeen++;
      }
      if (hours[m][1].substring(11, 13).equals("18")) {
        H_Eighteen++;
      }
      if (hours[m][1].substring(11, 13).equals("19")) {
        H_Nineteen++;
      }
      if (hours[m][1].substring(11, 13).equals("20")) {
        H_Twenty++;
      }
      if (hours[m][1].substring(11, 13).equals("21")) {
        H_Twenty_one++;
      }
      if (hours[m][1].substring(11, 13).equals("22")) {
        H_Twenty_two++;
      }
      if (hours[m][1].substring(11, 13).equals("23")) {
        H_Twenty_three++;
      }
    } //End of for loop
    Hours_list[0] = H_Zero;
    Hours_list[1] = H_One;
    Hours_list[2] = H_Two;
    Hours_list[3] = H_Three;
    Hours_list[4] = H_Four;
    Hours_list[5] = H_Five;
    Hours_list[6] = H_Six;
    Hours_list[7] = H_Seven;
    Hours_list[8] = H_Eight;
    Hours_list[9] = H_Nine;
    Hours_list[10] = H_Ten;
    Hours_list[11] = H_Eleven;
    Hours_list[12] = H_Twelve;
    Hours_list[13] = H_Thirteen;
    Hours_list[14] = H_Fourteen;
    Hours_list[15] = H_Fifteen;
    Hours_list[16] = H_Sixteen;
    Hours_list[17] = H_Seventeen;
    Hours_list[18] = H_Eighteen;
    Hours_list[19] = H_Nineteen;
    Hours_list[20] = H_Twenty;
    Hours_list[21] = H_Twenty_one;
    Hours_list[22] = H_Twenty_two;
    Hours_list[23] = H_Twenty_three;
    return Hours_list;
  }
  
}
