public class Button {
  int xpos;
  int ypos;
  int h;
  int w;
  
  public Button(int xsize, int ysize, int x, int y) {
    xpos = xsize;
    ypos = ysize;
    h = x;
    w = y;
  }
  
  public void Buttonsrender() {
    //"Adderall" Button
  fill(0, 0, 0, 50);  
  rect(((xpos - h)/2), ypos*0.005, h*0.15, ypos*0.025);
  text("Adderall", ((xpos - h)/2) + h*0.05, ypos*0.025);
  //"Vyvanse" Button
  fill(0, 0, 0, 50);
  rect((((xpos - h)/2) + h*0.275), ypos*0.005, h*0.15, ypos*0.025);
  text("Vyvanse", (((xpos - h)/2) + h*0.325), ypos*0.025);
  //"Ritalin" Button
  fill(0, 0, 0, 50);
  rect((((xpos - h)/2) + h*0.575), ypos*0.005, h*0.15, ypos*0.025);
  text("Ritalin", (((xpos - h)/2) + h*0.63), ysize*0.025);
  //"All" Button
  fill(0, 0, 0, 50);
  rect( (((xpos - h)/2) + h*0.85), ypos*0.005, h*0.15, ypos*0.025);
  text("All", (((xpos - h)/2) + h*0.9125), ypos*0.025);
  textAlign(RIGHT);




  }
  
}
