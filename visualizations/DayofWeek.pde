public class DayofWeek {
  int[] days_list;
  int Monday;
  int Tuesday;
  int Wednesday;
  int Thursday;
  int Friday;
  int Saturday;
  int Sunday;
  
  public DayofWeek() {
    days_list = new int[7];
  }
  
  public int[] CountDayofWeek(String[][] day) {
    for (int m = 0; m < day.length; m++) {
      if (day[m][1].substring(0, 3).equals("Mon")) {
        Monday++;
      }
      if (day[m][1].substring(0, 3).equals("Tue")) {
        Tuesday++;
      }
      if (day[m][1].substring(0, 3).equals("Wed")) {
        Wednesday++;
      }
      if (day[m][1].substring(0, 3).equals("Thu")) {
        Thursday++;
      }
      if (day[m][1].substring(0, 3).equals("Fri")) {
        Friday++;
      }
      if (day[m][1].substring(0, 3).equals("Sat")) {
        Saturday++;
      }
      if (day[m][1].substring(0, 3).equals("Sun")) {
        Sunday++;
      }
    } //End of for loop
    days_list[0] = Monday;
    days_list[1] = Tuesday;
    days_list[2] = Wednesday;
    days_list[3] = Thursday;
    days_list[4] = Friday;
    days_list[5] = Saturday;
    days_list[6] = Sunday;
    return days_list;
  }
  
}
