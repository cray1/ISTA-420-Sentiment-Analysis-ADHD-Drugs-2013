 import grafica.*;

/**
 tweetsfull[0][0] -> Medication ID...tweetsfull[0][1] -> Timestamp...tweetsfull[0][2] -> side effect...tweetsfull[0][3] -> good/bad...tweetsfull[0][4] -> time_zone:Central Time (US & Canada)
 tweetsfull[1][0] -> Medication ID...tweetsfull[1][1] -> Timestamp...tweetsfull[1][2] -> side effect...tweetsfull[1][3] -> good/bad...tweetsfull[1][4] -> time_zone:Arizona
 .
 .
 .
 tweetsfull[N][0] -> Medication ID...tweetsfull[N][1] -> Timestamp...tweetsfull[N][2] -> side effect...tweetsfull[N][3] -> good/bad...tweetsfull[N][4] -> time_zone:Quito
 N = # of tweet
 **/

/**
Parts of Visualization --> Graphs
                       --> Buttons for Adderall, Vyvanse, Ritalin & All
                       
SideEffects

Anorexia
Aggression
Incontinence
Dyspnoea
Dystonia
Heart problems
Convulsion
Tooth Injury
Fatigue
Nausea/Discomfort
Insomnia
Pallor
**/

//Sketch size
int xsize = 1000;
int ysize = 800;

//image size
int x = 962;
int y = 552;
PImage map;

int features = 6; //Number of Features in the file

String[] loadedtweets; //Each col is a tweet will all values we will have
String[] templist; //list of split tweet (by feature)
String temp2; //One tweet with all of its features
String[][] tweetsfull; //Array will rows = tweets; col = separate features of tweet

//2D Arrays that focuses on one Medication at a time (all features present)
String[][] Adderall_full;
String[][] Vyvanse_full;
String[][] Ritalin_full;

//Buttons - Class
Button Adderall_button;
Button Vyvanse_button;
Button Ritalin_button;
Button All_button;

//TimeZone Variable (Actually Renders on Map - shows as opacity)
TimeZone timetweetfull;
TimeZone Adderalltweets;
TimeZone Vyvansetweets;
TimeZone Ritalintweets;

//Medication Variables (Counts number of each medication from tweetsfull[][])
int[] medication_count;
Medication medication;

//DayofWeek Variables (Counts number of tweets within Mon, Tue, Wed, Thu, Fri, Sat, Sun)
int[] DayofWeek_total;
DayofWeek totaldayofweek;
int[] DayofWeek_Adderall;
DayofWeek Adderalldayofweek;
int[] DayofWeek_Vyvanse;
DayofWeek Vyvansedayofweek;
int[] DayofWeek_Ritalin;
DayofWeek Ritalindayofweek;

//Month Variables (Counts number of tweets within Jan, Feb, Mar....Dec)
int[] Month_total;
Month totalmonth;
int[] Month_Adderall;
Month Adderallmonth;
int[] Month_Vyvanse;
Month Vyvansemonth;
int[] Month_Ritalin;
Month Ritalinmonth;

//DayofMonth Variables (Counts number of tweets within 1 - 31 depending on the month)
int[] DayofMonth_total;
DayofMonth totaldayofmonth;
int[] DayofMonth_Adderall;
DayofMonth Adderalldayofmonth;
int[] DayofMonth_Vyvanse;
DayofMonth Vyvansedayofmonth;
int[] DayofMonth_Ritalin;
DayofMonth Ritalindayofmonth;

//Hours Variables (Counts number of tweets within that given hour 00:01 - 00:59 count as hour 00)
int[] Hours_total;
Hours totalhours;
int[] Hours_Adderall;
Hours Adderallhours;
int[] Hours_Vyvanse;
Hours Vyvansehours;
int[] Hours_Ritalin;
Hours Ritalinhours;

//TimeZone_Counter (Counts number of tweets within each TimeZone)
int[] TimeZone_total;
TimeZone_Counter totaltimezones;
int[] TimeZone_Adderall;
TimeZone_Counter Adderalltimezones;
int[] TimeZone_Vyvanse;
TimeZone_Counter Vyvansetimezones;
int[] TimeZone_Ritalin;
TimeZone_Counter Ritalintimezones;

//Good_Bad Counter (Counts number of tweets Good v Bad)
int[] GoodvBad_total;
GoodvBad totalgoodvbad;
int[] GoodvBad_Adderall;
GoodvBad Adderallgoodvbad;
int[] GoodvBad_Vyvanse;
GoodvBad Vyvansegoodvbad;
int[] GoodvBad_Ritalin;
GoodvBad Ritalingoodvbad;

//SideEffects Counter (side effect count)
int[] SideEffects_total;
SideEffects totalside_effects;
int[] SideEffects_Adderall;
SideEffects Adderallside_effects;
int[] SideEffects_Vyvanse;
SideEffects Vyvanseside_effects;
int[] SideEffects_Ritalin;
SideEffects Ritalinside_effects;

// Button Specs
int all_y = 3;
float Addx = (xsize)*0.02; // pos of add box
float Vyvx = (xsize)*0.28355;
float Ritx = (xsize)*0.57215;
float Allx = (xsize)*0.8367;
float rectWidthSize = x*0.15;
float rectHeightSize = ysize*0.025;
boolean AllOver = false;
boolean AddOver = false;
boolean VyvOver = false;
boolean RitOver = false;
boolean AllmouseOn = true;
boolean AddmouseOn = false;
boolean VyvmouseOn = false;
boolean RitmouseOn = false;


//Counters for Parsing data to individual 2D Arrays
int tadderall = 0;
int tvyvanse = 0;
int tritalin = 0;


//Graphing Variables (Hours versus number of tweets: Line)
GPlot Hoursvtweets = new GPlot(this);
GPointsArray Hours_t = new GPointsArray();
GPointsArray Hours_Add = new GPointsArray();
GPointsArray Hours_Vyv = new GPointsArray();
GPointsArray Hours_Rit = new GPointsArray();

//Graphing Variables (DayofWeek versus number of tweets: Histogram)
GPlot DayofWeekvtweets = new GPlot(this);
GPointsArray DayofWeek_t = new GPointsArray();
GPointsArray DayofWeek_Add = new GPointsArray();
GPointsArray DayofWeek_Vyv = new GPointsArray();
GPointsArray DayofWeek_Rit = new GPointsArray();

//Graphing Variables (Number for each medication of overall tweets: Histogram)
GPlot Medvtweets = new GPlot(this);
GPointsArray Med_t = new GPointsArray();
GPointsArray Med_Add = new GPointsArray();
GPointsArray Med_Vyv = new GPointsArray();
GPointsArray Med_Rit = new GPointsArray();

void setup() {
  size(xsize, ysize); //Size of Sketch (Independent of Size of Map)
//  background(0);
  map = loadImage("timezonemap.jpg");
  
  //Load Tweets (all features) into 2D Array, ROW = new tweet, COL = new feature
  loadedtweets = loadStrings("processed.txt");
  tweetsfull = new String[loadedtweets.length][features];
  for (int rows = 0; rows < loadedtweets.length; rows++) {
    temp2 = loadedtweets[rows];
    templist = split(temp2, '|');
    for (int cols = 0; cols < features; cols++) {
      tweetsfull[rows][cols] = templist[cols];
    }
  }
  
  //Count for which Medication (Adderall...etc)
  medication = new Medication();
  
  //Medication Counting
  medication_count = medication.CountMedication(tweetsfull);
  
  //Initializing New String[][]'s specific to a medication
  Adderall_full = new String[medication_count[0]][features];
  Vyvanse_full = new String[medication_count[1]][features];
  Ritalin_full = new String[medication_count[2]][features];
  
  //Count for which day of the week (Mon - Sun)
  totaldayofweek = new DayofWeek();
  Adderalldayofweek = new DayofWeek();
  Vyvansedayofweek = new DayofWeek();
  Ritalindayofweek = new DayofWeek();

  //Count for which month (Jan - Dec)
  totalmonth = new Month();
  Adderallmonth = new Month();
  Vyvansemonth = new Month();
  Ritalinmonth = new Month();
  
  //Count for which day of the month (01 - 31 [Depending on month])
  totaldayofmonth = new DayofMonth();
  Adderalldayofmonth = new DayofMonth();
  Vyvansedayofmonth = new DayofMonth();
  Ritalindayofmonth = new DayofMonth();
  
  //Count for which hour (00 - 23)
  totalhours = new Hours();
  Adderallhours = new Hours();
  Vyvansehours = new Hours();
  Ritalinhours = new Hours();
  
  //Count for if medication good or bad
  totalgoodvbad = new GoodvBad();
  Adderallgoodvbad = new GoodvBad();
  Vyvansegoodvbad = new GoodvBad();
  Ritalingoodvbad = new GoodvBad();
  
  //Count for Side Effects
  totalside_effects = new SideEffects();
  Adderallside_effects = new SideEffects();
  Vyvanseside_effects = new SideEffects();
  Ritalinside_effects = new SideEffects();
  
  //Parses all the tweets with the Medication ID of Adderall to Adderall_full 2DArray
  for (int r = 0; r < loadedtweets.length; r++) {
    if (tweetsfull[r][0].equals("Adderall")) {
      for (int c = 0; c < features; c++) {
        Adderall_full[tadderall][c] = tweetsfull[r][c];
      }
      tadderall++;
    }
    //Parses all the tweets with the Medication ID of Vyvanse to Vyvanse_full 2DArray
    if (tweetsfull[r][0].equals("Vyvanse")) {
      for (int c = 0; c < features; c++) {
        Vyvanse_full[tvyvanse][c] = tweetsfull[r][c];
      }
      tvyvanse++;
    }
    //Parses all the tweets with the Medication ID of Ritalin to Ritalin_full 2DArray
    if (tweetsfull[r][0].equals("Ritalin")) {
      for (int c = 0; c < features; c++) {
        Ritalin_full[tritalin][c] = tweetsfull[r][c];
      }
      tritalin++;
    }
  }
  
  //DayofWeek Counting
  DayofWeek_total = totaldayofweek.CountDayofWeek(tweetsfull);
  DayofWeek_Adderall = Adderalldayofweek.CountDayofWeek(Adderall_full);
  DayofWeek_Vyvanse = Vyvansedayofweek.CountDayofWeek(Vyvanse_full);
  DayofWeek_Ritalin = Ritalindayofweek.CountDayofWeek(Ritalin_full);
  
  //TimeZone_Count (number of tweets within each TimeZone)
  totaltimezones = new TimeZone_Counter();
  Adderalltimezones = new TimeZone_Counter();
  Vyvansetimezones = new TimeZone_Counter();
  Ritalintimezones = new TimeZone_Counter();
  
  //TimeZone_Counter Counting
  TimeZone_total = totaltimezones.CountTimeZones(tweetsfull);
  TimeZone_Adderall = Adderalltimezones.CountTimeZones(Adderall_full);
  TimeZone_Vyvanse = Vyvansetimezones.CountTimeZones(Vyvanse_full);
  TimeZone_Ritalin = Ritalintimezones.CountTimeZones(Ritalin_full);
  
  //Initialize Variables for Rendering TimeZones
  timetweetfull = new TimeZone(tweetsfull.length, TimeZone_total, medication_count[0], medication_count[1], medication_count[2]);
  Adderalltweets = new TimeZone(Adderall_full.length, TimeZone_Adderall, medication_count[0], 0, 0);
  Vyvansetweets = new TimeZone(Vyvanse_full.length, TimeZone_Vyvanse, 0, medication_count[1], 0);
  Ritalintweets = new TimeZone(Ritalin_full.length, TimeZone_Ritalin, 0, 0, medication_count[2]);
    
  //Hours Counting
  Hours_total = totalhours.CountHours(tweetsfull);
  Hours_Adderall = Adderallhours.CountHours(Adderall_full);
  Hours_Vyvanse = Vyvansehours.CountHours(Vyvanse_full);
  Hours_Ritalin = Ritalinhours.CountHours(Ritalin_full);
  
  //Setup for Hours versus number of Tweets Graph
  Hoursvtweets.setPos(19, 600);
  for(int i = 0; i < Hours_total.length; i++) {
    Hours_t.add(i, Hours_total[i]);
  }
  for(int i = 0; i < Hours_Adderall.length; i++) {
    Hours_Add.add(i, Hours_Adderall[i]);
  }
  for(int i = 0; i < Hours_Vyvanse.length; i++) {
    Hours_Vyv.add(i, Hours_Vyvanse[i]);
  }
  for(int i = 0; i < Hours_Ritalin.length; i++) {
    Hours_Rit.add(i, Hours_Ritalin[i]);
  }
  Hoursvtweets.setMar(10, 10, 10, 10);
  Hoursvtweets.setDim(250, 100);
  Hoursvtweets.setXLim(0, 23);
  Hoursvtweets.beginDraw();
    Hoursvtweets.drawBox();
    Hoursvtweets.drawXAxis();
    Hoursvtweets.drawYAxis();
  Hoursvtweets.endDraw();
  
  Medvtweets.setPos(375, 600);
  for(int i = 0; i < medication_count.length; i++) {
    Med_t.add(i, medication_count[i]);
  }
  Medvtweets.setMar(10, 10, 10, 10);
  Medvtweets.setDim(250, 100);
  Medvtweets.setXLim(0, 2);
  Medvtweets.startHistograms(GPlot.VERTICAL);
  Medvtweets.getHistogram().setBgColors(new color[] {color(255, 0, 0, 50), color(0, 255, 0, 50), color(0, 0, 255, 50)});
  Medvtweets.setPoints(Med_t);
  Medvtweets.beginDraw();
    Medvtweets.drawBox();
    Medvtweets.drawXAxis();
    Medvtweets.drawYAxis();
    Medvtweets.drawHistograms();
  Medvtweets.endDraw();
  
  //Setup for DayofWeek versus number of tweets Graph
  DayofWeekvtweets.setPos(720, 600);
  for(int i = 0; i < DayofWeek_total.length; i++) {
    DayofWeek_t.add(i, DayofWeek_total[i]);
  }
  for(int i = 0; i < DayofWeek_Adderall.length; i++) {
    DayofWeek_Add.add(i, DayofWeek_Adderall[i]);
  }
  for(int i = 0; i < DayofWeek_Vyvanse.length; i++) {
    DayofWeek_Vyv.add(i, DayofWeek_Vyvanse[i]);
  }
  for(int i = 0; i < DayofWeek_Ritalin.length; i++) {
    DayofWeek_Rit.add(i, DayofWeek_Ritalin[i]);
  }
  DayofWeekvtweets.setMar(10, 10, 10, 10);
  DayofWeekvtweets.setDim(250, 100);
  DayofWeekvtweets.setXLim(0, 6);
  DayofWeekvtweets.startHistograms(GPlot.VERTICAL);
  DayofWeekvtweets.beginDraw();
    DayofWeekvtweets.drawBox();
    DayofWeekvtweets.drawXAxis();
    DayofWeekvtweets.drawYAxis();
  DayofWeekvtweets.endDraw();
  
  //Making the Buttons
//  Adderall_button = new Button(xsize, ysize, x, y);
//  Vyvanse_button = new Button(xsize, ysize, x, y);
//  Ritalin_button = new Button(xsize, ysize, x, y);
//  All_button = new Button(xsize, ysize, x, y);
//  Adderall_button.Buttonsrender();
//  Vyvanse_button.Buttonsrender();
//  Ritalin_button.Buttonsrender();
//  All_button.Buttonsrender();
  
    //Month Counting
  Month_total = totalmonth.CountMonth(tweetsfull);
  Month_Adderall = Adderallmonth.CountMonth(Adderall_full);
  Month_Vyvanse = Vyvansemonth.CountMonth(Vyvanse_full);
  Month_Ritalin = Ritalinmonth.CountMonth(Ritalin_full);
  
  //DayofMonth Counting
  DayofMonth_total = totaldayofmonth.CountDayofMonth(tweetsfull);
  DayofMonth_Adderall = Adderalldayofmonth.CountDayofMonth(Adderall_full);
  DayofMonth_Vyvanse = Vyvansedayofmonth.CountDayofMonth(Vyvanse_full);
  DayofMonth_Ritalin = Ritalindayofmonth.CountDayofMonth(Ritalin_full);
  
  //Good v Bad Counting
  GoodvBad_total = totalgoodvbad.CountGoodvBad(tweetsfull);
  GoodvBad_Adderall = Adderallgoodvbad.CountGoodvBad(Adderall_full);
  GoodvBad_Vyvanse = Vyvansegoodvbad.CountGoodvBad(Vyvanse_full);
  GoodvBad_Ritalin = Ritalingoodvbad.CountGoodvBad(Ritalin_full);
  float totalRatio = ((float)GoodvBad_total[0]/((float)GoodvBad_total[0]+(float)GoodvBad_total[1]));
  float AdderallRatio = ((float)GoodvBad_Adderall[0]/((float)GoodvBad_Adderall[0]+ (float) GoodvBad_Adderall[1]));
  float VyvanseRatio = ((float)GoodvBad_Vyvanse[0]/((float)GoodvBad_Vyvanse[0] + (float)GoodvBad_Vyvanse[1]));
  float RitalinRatio = ((float)GoodvBad_Ritalin[0]/((float)GoodvBad_Ritalin[0]+(float)GoodvBad_Ritalin[0]));
  
  //Side Effects Counting
  SideEffects_total = totalside_effects.CountSideEffects(tweetsfull);
  SideEffects_Adderall = Adderallside_effects.CountSideEffects(Adderall_full);
  SideEffects_Vyvanse = Vyvanseside_effects.CountSideEffects(Vyvanse_full);
  SideEffects_Ritalin = Ritalinside_effects.CountSideEffects(Ritalin_full);
  
  
  //Sentiment Gage
    stroke(0);
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
    fill(0);
    textSize(26);
    text("+", 305, 760);
    textSize(32);
    text("-",685,760);  
    textSize(13);
    text("Satisfaction", 470,760);
     println(totalRatio);
     println(AdderallRatio);
     println(VyvanseRatio);
     println(RitalinRatio);
    
    
    //Graph Titles
    text("Hour of the Day",100,600);
    text("Total Tweets",475,600);
    text("Day of the Week",800,600);
    
} //End of Setup Function

void draw() {
  image(map, (xsize - x)/2, (ysize - y)/8); //Image placement
  update(mouseX, mouseY);
  fill(255, 0);
    
  if(!AddmouseOn && !VyvmouseOn && !RitmouseOn && !AllmouseOn) {
    stroke(0);
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
  } else {
  if(AddmouseOn) {
    stroke(0);
    Adderalltweets.rendertzone();
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
    fill(0,255,0);
    rect(300,765,(.14831181*400),25); 
  }
  if(VyvmouseOn) {
    stroke(0);
    Vyvansetweets.rendertzone();
//    stroke(0, 255, 0);
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
    fill(0,255,0);
    rect(300,765,(.36208382*400),25); 
  } 
  
  if (RitmouseOn) {
    stroke(0);
    Ritalintweets.rendertzone();
//    stroke(0, 0, 255);
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
    fill(0,255,0);
    rect(300,765,(.5*400),25); 
  }
  if (AllmouseOn) {
    stroke(0);
    Adderalltweets.rendertzone();
    Vyvansetweets.rendertzone();
    Ritalintweets.rendertzone();
    //timetweetfull.rendertzone();
//    stroke(255, 255, 255);
    strokeWeight(2);
    fill(255,0,0);
    rect(300,765,400,25);
    strokeWeight(1);
    fill(0,255,0);
    rect(300,765,(.16307661*400),25); 
  }
  }
  
  //TimeZone Rendering with Buttons
 
  if (AddOver && !AddmouseOn) {
    stroke(255, 0, 0);
    fill(255);
    rect(((xsize - x)/2), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Adderall", ((xsize - x)/2) + x*0.05, ysize*0.025);
    stroke(0);
  }
   else if (AddOver && AddmouseOn) {
    stroke(0);
    fill(255,0,0,50);
    rect(((xsize - x)/2), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Adderall", ((xsize - x)/2) + x*0.05, ysize*0.025);
    
    
  }
  else if (!AddOver && !AddmouseOn) {
    stroke(0);
    fill(255);
    rect(((xsize - x)/2), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Adderall", ((xsize - x)/2) + x*0.05, ysize*0.025);
  }
   else if (!AddOver && AddmouseOn) {
    stroke(0);
    fill(255,0,0,50);
    rect(((xsize - x)/2), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Adderall", ((xsize - x)/2) + x*0.05, ysize*0.025);
  }
  
  if (VyvOver && !VyvmouseOn) {
    stroke(0, 255, 0);
    fill(255);
    rect((((xsize - x)/2) + x*0.275), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Vyvanse", (((xsize - x)/2) + x*0.325), ysize*0.025);
    stroke(0);
  }
   else if(VyvOver && VyvmouseOn) {
    stroke(0);
    fill(0,255,0,50);
    rect((((xsize - x)/2) + x*0.275), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Vyvanse", (((xsize - x)/2) + x*0.325), ysize*0.025);
  }
  else if(!VyvOver && !VyvmouseOn) {
    stroke(0);
    fill(255);
    rect((((xsize - x)/2) + x*0.275), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Vyvanse", (((xsize - x)/2) + x*0.325), ysize*0.025);
  }
  else if (!VyvOver && VyvmouseOn) {
    stroke(0);
    fill(0,255,0,50);
    rect((((xsize - x)/2) + x*0.275), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Vyvanse", (((xsize - x)/2) + x*0.325), ysize*0.025);
  }

  if (RitOver && !RitmouseOn) {
    stroke(0, 0, 255);
    fill(255);
    rect((((xsize - x)/2) + x*0.575), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Ritalin", (((xsize - x)/2) + x*0.63), ysize*0.025);
    stroke(0);
  }
  else if(RitOver && RitmouseOn) {
    stroke(0);
    fill(0,0,255,50);
    rect((((xsize - x)/2) + x*0.575), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Ritalin", (((xsize - x)/2) + x*0.63), ysize*0.025);
  }
  else if(!RitOver && !RitmouseOn) {
    stroke(0);
    fill(255);
    rect((((xsize - x)/2) + x*0.575), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Ritalin", (((xsize - x)/2) + x*0.63), ysize*0.025);
  }
  else if (!RitOver && RitmouseOn) {
    stroke(0);
    fill(0,0,255,50);
    rect((((xsize - x)/2) + x*0.575), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("Ritalin", (((xsize - x)/2) + x*0.63), ysize*0.025);
  }
  
  if (AllOver && !AllmouseOn) {
    stroke(255);
    fill(255);
    rect( (((xsize - x)/2) + x*0.85), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("All", (((xsize - x)/2) + x*0.9125), ysize*0.025);
    stroke(0);
  }
  else if(AllOver && AllmouseOn) {
    stroke(0);
    fill(0);
    rect( (((xsize - x)/2) + x*0.85), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(255);
    text("All", (((xsize - x)/2) + x*0.9125), ysize*0.025);
  }
  else if(!AllOver && !AllmouseOn) {
    stroke(0);
    fill(255);
    rect((((xsize - x)/2) + x*0.85), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(0);
    text("All", (((xsize - x)/2) + x*0.9125), ysize*0.025);
  }
  else if (!AllOver && AllmouseOn) {
    fill(0);
    rect((((xsize - x)/2) + x*0.85), ysize*0.005, rectWidthSize, rectHeightSize);
    fill(255);
    text("All", (((xsize - x)/2) + x*0.9125), ysize*0.025);
  }

} //End of Draw Function

void update(int x, int y) {
  if ( mouseX > Addx && mouseX < Addx + rectWidthSize && mouseY > all_y - rectHeightSize && mouseY < all_y + rectHeightSize ) {
    AddOver = true;
  }
  else {
    AddOver = false;
  }
  if ( mouseX > Vyvx && mouseX < Vyvx + rectWidthSize && mouseY > all_y - rectHeightSize && mouseY < all_y + rectHeightSize ) {
    VyvOver = true;
  }
  else {
    VyvOver = false;
  }
  if ( mouseX > Ritx && mouseX < Ritx + rectWidthSize && mouseY > all_y - rectHeightSize && mouseY < all_y + rectHeightSize ) {
    RitOver = true;
  }
  else {
    RitOver = false;
  }
  if ( mouseX > Allx && mouseX < Allx + rectWidthSize && mouseY > all_y - rectHeightSize && mouseY < all_y + rectHeightSize ) {
    AllOver = true;
  }
  else {
    AllOver = false;
  }
}

void mousePressed() {
  if (AddOver) {
    if (AddmouseOn == false) {
      AddmouseOn = true;
      AllmouseOn = false;
      Adderalltweets.rendertzone();
      Hoursvtweets.setPoints(Hours_Add);
      Hoursvtweets.defaultDraw();
      
      DayofWeekvtweets.setPoints(DayofWeek_Add);
      DayofWeekvtweets.beginDraw();
        DayofWeekvtweets.drawBox();
        DayofWeekvtweets.drawHistograms();
      DayofWeekvtweets.endDraw();
     }
     else {
       AddmouseOn = false;
     }
  }
  if (VyvOver) {
    if (VyvmouseOn == false) {
      VyvmouseOn = true;
      AllmouseOn = false;
      Vyvansetweets.rendertzone();
      Hoursvtweets.setPoints(Hours_Vyv);
      Hoursvtweets.defaultDraw();
      
      DayofWeekvtweets.setPoints(DayofWeek_Vyv);
      DayofWeekvtweets.beginDraw();
        DayofWeekvtweets.drawBox();
        DayofWeekvtweets.drawHistograms();
      DayofWeekvtweets.endDraw();
    }
    else {
      VyvmouseOn = false;
    }
  }
  if (RitOver) {
    if (RitmouseOn == false) {
      RitmouseOn = true;
      AllmouseOn = false;
      Ritalintweets.rendertzone();
      Hoursvtweets.setPoints(Hours_Rit);
      Hoursvtweets.defaultDraw();
      
      DayofWeekvtweets.setPoints(DayofWeek_Rit);
      DayofWeekvtweets.beginDraw();
        DayofWeekvtweets.drawBox();
        DayofWeekvtweets.drawHistograms();
      DayofWeekvtweets.endDraw();
    }
    else {
      RitmouseOn = false;
    }
  }
  if (AllOver) {
    if (AllmouseOn == false) {
      AllmouseOn = true;
      AddmouseOn = false;
      VyvmouseOn = false;
      RitmouseOn = false;
      timetweetfull.rendertzone();
      Hoursvtweets.setPoints(Hours_t);
      Hoursvtweets.defaultDraw();
      
      DayofWeekvtweets.setPoints(DayofWeek_t);
      DayofWeekvtweets.beginDraw();
        DayofWeekvtweets.drawBox();
        DayofWeekvtweets.drawHistograms();
      DayofWeekvtweets.endDraw();
    }
    else {
      AllmouseOn = false;
    }
  }
  
}
