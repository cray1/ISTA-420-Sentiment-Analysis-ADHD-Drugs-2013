public class Month {
  int[] Month_list;
  int January;
  int February;
  int March;
  int April;
  int May;
  int June;
  int July;
  int August;
  int September;
  int October;
  int November;
  int December;
  
  public Month() {
    Month_list = new int[12];
  }
  
  public int[] CountMonth(String[][] month) {
    for (int m = 0; m < month.length; m++) {
      if (month[m][1].substring(4, 7).equals("Jan")) {
      January++;
      }
      if (month[m][1].substring(4, 7).equals("Feb")) {
        February++;
      }
      if (month[m][1].substring(4, 7).equals("Mar")) {
        March++;
      }
      if (month[m][1].substring(4, 7).equals("Apr")) {
        April++;
      }
      if (month[m][1].substring(4, 7).equals("May")) {
        May++;
      }
      if (month[m][1].substring(4, 7).equals("Jun")) {
        June++;
      }
      if (month[m][1].substring(4, 7).equals("Jul")) {
        July++;
      }
      if (month[m][1].substring(4, 7).equals("Aug")) {
        August++;
      }
      if (month[m][1].substring(4, 7).equals("Sep")) {
        September++;
      }
      if (month[m][1].substring(4, 7).equals("Oct")) {
        October++;
      }
      if (month[m][1].substring(4, 7).equals("Nov")) {
        November++;
      }
      if (month[m][1].substring(4, 7).equals("Dec")) {
        December++;
      }
    } //End of for loop
    Month_list[0] = January;
    Month_list[1] = February;
    Month_list[2] = March;
    Month_list[3] = April;
    Month_list[4] = May;
    Month_list[5] = June;
    Month_list[6] = July;
    Month_list[7] = August;
    Month_list[8] = September;
    Month_list[9] = October;
    Month_list[10] = November;
    Month_list[11] = December;
    return Month_list;
  }
  
}
