/**
UTC_offsets
-39600 == UTC-11 || UTC+13 --> Alofi --> Midway
-36000 == UTC-10 --> Hawaii
-32400 == UTC-9 --> Alaska
-28800 == UTC-8 --> Pacific Time (US and Canada)
-25200 == UTC-7 --> Arizona --> Mountain Time (US & Canada)
-21600 == UTC-6 --> Central Time (US & Canada)
-18000 == UTC-5 --> Eastern Time (US & Canada) --> Indiana (East) --> Quito
-14400 == UTC-4 --> Atlantic Time (US & Canada)
-10800 == UTC-3 --> Buenos Aires
-7200 == UTC-2 --> Brasilia
-3600 == UTC-1 --> Ponta Delgada (Azores)
-0 == UTC --> London
+3600 == UTC+1 --> Amsterdam
+7200 == UTC+2 --> Athens
+10800 == UTC+3 --> Riyadh
+14400 == UTC+4 --> Dubai
+18000 == UTC+5 --> New Delhi --> Amsterdam Island
+21600 == UTC+6 --> Almaty
+25200 == UTC+7 --> Bangkok
+28800 == UTC+8 --> Bejing --> Perth
+32400 == UTC+9 --> Tokyo
+36000 == UTC+10 --> Guam
+39600 == UTC+11 --> Honlara
+43200 == UTC+12 --> Baker Island
**/

/**
UTC_offsets REAL
-39600 == UTC-11 || UTC+13 --> International Date Line West
-36000 == UTC-10 --> Hawaii
-32400 == UTC-9 --> Alaska
-28800 == UTC-8 --> Pacific Time (US and Canada)
-25200 == UTC-7 --> Arizona --> Mountain Time (US & Canada)
-21600 == UTC-6 --> Central Time (US & Canada)
-18000 == UTC-5 --> Eastern Time (US & Canada) --> Indiana (East) --> Quito
-14400 == UTC-4 --> Atlantic Time (US & Canada)
-10800 == UTC-3 --> Greenland --> Santiago
-7200 == UTC-2 --> Brasilia --> Mid-Atlantic
-3600 == UTC-1 --> Azores
0 == UTC --> London --> Casablanca --> Dublin --> Edinburgh
3600 == UTC+1 --> Amsterdam
7200 == UTC+2 --> Istanbul --> Athens --> Pretoria --> Riga --> Jerusalem
10800 == UTC+3 --> Riyadh --> Narirobi --> Baghdad --> Kuwait
14400 == UTC+4 --> Abu Dhabi --> Moscow
18000 == UTC+5 --> Islamabad
21600 == UTC+6 --> Almaty
25200 == UTC+7 --> Bangkok --> Jakarta
28800 == UTC+8 --> Bejing --> Kuala Lumpur --> Hong Kong --> Singapore --> Urumqi
32400 == UTC+9 --> Irkutsk --> Tokyo --> Sappore --> Seoul
36000 == UTC+10 --> Brisbane --> Guam
39600 == UTC+11 --> New Caledonia --> Sydney --> Melbourne --> Hobart
43200 == UTC+12 --> Baker Island
**/

public class TimeZone {
  int totaltweets;
  int utc_n11;
  int utc_n10;
  int utc_n9;
  int utc_n8;
  int utc_n7;
  int utc_n6;
  int utc_n5;
  int utc_n4;
  int utc_n3;
  int utc_n2;
  int utc_n1;
  int utc_0;
  int utc_p1;
  int utc_p2;
  int utc_p3;
  int utc_p4;
  int utc_p5;
  int utc_p6;
  int utc_p7;
  int utc_p8;
  int utc_p9;
  int utc_p10;
  int utc_p11;
  int utc_p12;
  int Adderall;
  int Vyvanse;
  int Ritalin;
  
  public TimeZone(int total, int[] TimeZoneCount, int Add, int Vyv, int Rit) {
    totaltweets = total;
    utc_n11 = TimeZoneCount[0];
    utc_n10 = TimeZoneCount[1];
    utc_n9 = TimeZoneCount[2];
    utc_n8 = TimeZoneCount[3];
    utc_n7 = TimeZoneCount[4];
    utc_n6 = TimeZoneCount[5];
    utc_n5 = TimeZoneCount[6];
    utc_n4 = TimeZoneCount[7];
    utc_n3 = TimeZoneCount[8];
    utc_n2 = TimeZoneCount[9];
    utc_n1 = TimeZoneCount[10];
    utc_0 = TimeZoneCount[11];
    utc_p1 = TimeZoneCount[12];
    utc_p2 = TimeZoneCount[13];
    utc_p3 = TimeZoneCount[14];
    utc_p4 = TimeZoneCount[15];
    utc_p5 = TimeZoneCount[16];
    utc_p6 = TimeZoneCount[17];
    utc_p7 = TimeZoneCount[18];
    utc_p8 = TimeZoneCount[19];
    utc_p9 = TimeZoneCount[20];
    utc_p10 = TimeZoneCount[21];
    utc_p11 = TimeZoneCount[22];
    utc_p12 = TimeZoneCount[23];
    Adderall = Add;
    Vyvanse = Vyv;
    Ritalin = Rit;
  }
  
  public void rendertzone() {
    //Alofi
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n11/totaltweets)*1000);
    rect(((xsize + x)/2)*0.04, (ysize - y)/8, x*0.04, y); //UTC-11
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n11/totaltweets)*1000);
    rect(((xsize + x)/2)*0.98, (ysize - y)/8, x*0.02, y); //UTC-11 || UTC+13
    
    //Hawaii
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n10/totaltweets)*1000);
    rect(((xsize + x)/2)*0.08, (ysize - y)/8, x*0.04, y); //UTC-10
    //Alaska
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n9/totaltweets)*1000);
    rect(((xsize + x)/2)*0.12, (ysize - y)/8, x*0.04, y); //UTC-9
    //Pacific Time (US and Canada)
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n8/totaltweets)*1000);
    rect(((xsize + x)/2)*0.16, (ysize - y)/8, x*0.04, y); //UTC-8
    //Arizona
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n7/totaltweets)*1000);
    rect(((xsize + x)/2)*0.20, (ysize - y)/8, x*0.035, y); //UTC-7
    //Central Time (US & Canada)
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n6/totaltweets)*1000);
    rect(((xsize + x)/2)*0.235, (ysize - y)/8, x*0.04, y); //UTC-6
    //Eastern Time (US & Canada)
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n5/totaltweets)*1000);
    rect(((xsize + x)/2)*0.275, (ysize - y)/8, x*0.04, y); //UTC-5
    //Atlantic Time (US & Canada)
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n4/totaltweets)*1000);
    rect(((xsize + x)/2)*0.315, (ysize - y)/8, x*0.04, y); //UTC-4
    //Buenos Aires
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n3/totaltweets)*1000);
    rect(((xsize + x)/2)*0.355, (ysize - y)/8, x*0.04, y); //UTC-3
    //Brasilia
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n2/totaltweets)*1000);
    rect(((xsize + x)/2)*0.395, (ysize - y)/8, x*0.04, y); //UTC-2
    //Ponta Delgada (Azores)
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_n1/totaltweets)*1000);
    rect(((xsize + x)/2)*0.435, (ysize - y)/8, x*0.035, y); //UTC-1
    //London
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_0/totaltweets)*1000);
    rect(((xsize + x)/2)*0.47, (ysize - y)/8, x*0.04, y); //UTC-0
    //Amsterdam
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p1/totaltweets)*1000);
    rect(((xsize + x)/2)*0.51, (ysize - y)/8, x*0.04, y); //UTC+1
    //Athens
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p2/totaltweets)*1000);
    rect(((xsize + x)/2)*0.55, (ysize - y)/8, x*0.04, y); //UTC+2
    //Riyadh
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p3/totaltweets)*1000);
    rect(((xsize + x)/2)*0.59, (ysize - y)/8, x*0.04, y); //UTC+3
    //Dubai
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p4/totaltweets)*1000);
    rect(((xsize + x)/2)*0.63, (ysize - y)/8, x*0.04, y); //UTC+4
    //New Delhi
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p5/totaltweets)*1000);
    rect(((xsize + x)/2)*0.67, (ysize - y)/8, x*0.035, y); //UTC+5
    //Almaty
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p6/totaltweets)*1000);
    rect(((xsize + x)/2)*0.705, (ysize - y)/8, x*0.04, y); //UTC+6
    //Bangkok
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p7/totaltweets)*1000);
    rect(((xsize + x)/2)*0.745, (ysize - y)/8, x*0.04, y); //UTC+7
    //Bejing --> Perth
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p8/totaltweets)*1000);
    rect(((xsize + x)/2)*0.785, (ysize - y)/8, x*0.04, y); //UTC+8
    //Tokyo
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p9/totaltweets)*1000);
    rect(((xsize + x)/2)*0.825, (ysize - y)/8, x*0.04, y); //UTC+9
    //Guam
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p10/totaltweets)*1000);
    rect(((xsize + x)/2)*0.865, (ysize - y)/8, x*0.04, y); //UTC+10
    //Honlara
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p11/totaltweets)*1000);
    rect(((xsize + x)/2)*0.905, (ysize - y)/8, x*0.035, y); //UTC+11
    //Baker Island
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p12/totaltweets)*1000);
    rect(((xsize - x)/2), (ysize - y)/8, x*0.02, y); //UTC+12
    fill(((float) Adderall/totaltweets)*255, ((float) Vyvanse/totaltweets)*255, ((float) Ritalin/totaltweets)*255, ((float) utc_p12/totaltweets)*1000);
    rect(((xsize + x)/2)*0.94, (ysize - y)/8, x*0.04, y); //UTC+12

  }
  
}
