public class TimeZone_Counter {
  int[] TimeZone_Counter_list;
  int International_Date_Line_West;
  int Hawaii;
  int Alaska;
  int Pacific;
  int Arizona; //Mountain Time (US & Canada)
  int Central;
  int Eastern; //Indiana (East) && Quito
  int Atlantic;
  int Greenland; //Greenland && Santiago
  int Brasilia;
  int Azores;
  int London; //Casablanca && Dublin && Edinburgh
  int Amsterdam;
  int Athens; //Istanbul && Pretoria && Riga && Jerusalem
  int Riyadh; //Narirobi --> Baghdad --> Kuwait
  int Moscow; //Abu Dhabi --> Moscow
  int Islamabad;
  int Almaty;
  int Bangkok; //Jakarta
  int Bejing; //Kuala Lumpur --> Hong Kong --> Singapore --> Urumqi
  int Tokyo; //Irkutsk --> Sappore --> Seoul
  int Guam; //Brisbane
  int Sydney; //New Caledonia && Melbourne && Hobart
  int Baker_Island;
  int No_GeoLocation;
  
  public TimeZone_Counter() {
    TimeZone_Counter_list = new int[25];
  }
  
  public int[] CountTimeZones(String[][] Z) {
    for (int m = 0; m < Z.length; m++) {
      if (Z[m][4].equals("International Date Line West")) {
        International_Date_Line_West++;
      }
      if (Z[m][4].equals("Hawaii")) {
        Hawaii++;
      }
      if (Z[m][4].equals("Alaska")) {
        Alaska++;
      }
      if (Z[m][4].equals("Pacific Time (US and Canada)")) {
        Pacific++;
      }
      if (Z[m][4].equals("Arizona") || Z[m][4].equals("Mountain Time (US & Canada)")) {
        Arizona++;
      }
      if (Z[m][4].equals("Central Time (US & Canada)")) {
        Central++;
      }
      if (Z[m][4].equals("Eastern Time (US & Canada)") || Z[m][4].equals("Indiana (East)") || Z[m][4].equals("Quito")) {
        Eastern++;
      }
      if (Z[m][4].equals("Atlantic Time (US & Canada)")) {
        Atlantic++;
      }
      if (Z[m][4].equals("Greenland") || Z[m][4].equals("Santiago")) {
        Greenland++;
      }
      if (Z[m][4].equals("Brasilia") || Z[m][4].equals("Mid-Atlantic")) {
        Brasilia++;
      }
      if (Z[m][4].equals("Azores")) {
        Azores++;
      }
      if (Z[m][4].equals("London") || Z[m][4].equals("Casablanca") || Z[m][4].equals("Dublin") || Z[m][4].equals("Edinburgh")) {
        London++;
      }
      if (Z[m][4].equals("Amsterdam")) {
        Amsterdam++;
      }
      if (Z[m][4].equals("Athens") || Z[m][4].equals("Istanbul") || Z[m][4].equals("Pretoria") || Z[m][4].equals("Riga") || Z[m][4].equals("Jerusalem")) {
        Athens++;
      }
      if (Z[m][4].equals("Riyadh") || Z[m][4].equals("Narirobi") || Z[m][4].equals("Baghdad") || Z[m][4].equals("Kuwait")) {
        Riyadh++;
      }
      if (Z[m][4].equals("Moscow") || Z[m][4].equals("Abu Dhabi")) {
        Moscow++;
      }
      if (Z[m][4].equals("Islamabad")) {
        Islamabad++;
      }
      if (Z[m][4].equals("Almaty")) {
        Almaty++;
      }
      if (Z[m][4].equals("Bangkok") || Z[m][4].equals("Jakarta")) {
        Bangkok++;
      }
      if (Z[m][4].equals("Bejing") || Z[m][4].equals("Kuala Lumpur") || Z[m][4].equals("Hong Kong") || Z[m][4].equals("Singapore") || Z[m][4].equals("Urumqi")) {
        Bejing++;
      }
      if (Z[m][4].equals("Tokyo") || Z[m][4].equals("Irkutsk") || Z[m][4].equals("Sappore") || Z[m][4].equals("Seoul")) {
        Tokyo++;
      }
      if (Z[m][4].equals("Guam") || Z[m][4].equals("Brisbane")) {
        Guam++;
      }
      if (Z[m][4].equals("Sydney") || Z[m][4].equals("New Caledonia") || Z[m][4].equals("Melbourne") || Z[m][4].equals("Hobart")) {
        Sydney++;
      }
      if (Z[m][4].equals("Baker Island")) {
        Baker_Island++;
      }
      if (Z[m][4].equals("None") && Z[m][5].equals("None")) {
        No_GeoLocation++;
      }
    } //End of for loop
    TimeZone_Counter_list[0] = International_Date_Line_West;
    TimeZone_Counter_list[1] = Hawaii;
    TimeZone_Counter_list[2] = Alaska;
    TimeZone_Counter_list[3] = Pacific;
    TimeZone_Counter_list[4] = Arizona;
    TimeZone_Counter_list[5] = Central;
    TimeZone_Counter_list[6] = Eastern;
    TimeZone_Counter_list[7] = Atlantic;
    TimeZone_Counter_list[8] = Greenland;
    TimeZone_Counter_list[9] = Brasilia;
    TimeZone_Counter_list[10] = Azores;
    TimeZone_Counter_list[11] = London;
    TimeZone_Counter_list[12] = Amsterdam;
    TimeZone_Counter_list[13] = Athens;
    TimeZone_Counter_list[14] = Riyadh;
    TimeZone_Counter_list[15] = Moscow;
    TimeZone_Counter_list[16] = Islamabad;
    TimeZone_Counter_list[17] = Almaty;
    TimeZone_Counter_list[18] = Bangkok;
    TimeZone_Counter_list[19] = Bejing;
    TimeZone_Counter_list[20] = Tokyo;
    TimeZone_Counter_list[21] = Guam;
    TimeZone_Counter_list[22] = Sydney;
    TimeZone_Counter_list[23] = Baker_Island;
    TimeZone_Counter_list[24] = No_GeoLocation;
    return TimeZone_Counter_list;
  }
  
}
