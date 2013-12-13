public class GoodvBad {
  int[] GorB_list;
  int Good;
  int Bad;
  
  public GoodvBad() {
    GorB_list = new int[2];
  }
  
  public int[] CountGoodvBad(String[][] sentiment) {
    for (int m = 0; m < sentiment.length; m++) {
      if (sentiment[m][3].equals("positive")) {
        Good++;
      }
      if (sentiment[m][3].equals("negative")) {
        Bad++;
      }
    } //End of for loop
    GorB_list[0] = Good;
    GorB_list[1] = Bad;
    return GorB_list;
  }
  
  public void GvBrender() {
   fill(0);
  rect(300,750,100,50); 
  }
  
  
}
