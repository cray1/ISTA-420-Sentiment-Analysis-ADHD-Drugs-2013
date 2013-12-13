public class SideEffects {
  int[] side_effects_list;
  int Insomnia;
  int Heart_problems;
  int Dystonia;
  int Fatigue;
  int Aggression;
  int Dyspnoea;
  int Incontinence;
  int Anorexia;
  int Pallor;
  int Inconclusive;
  
  public SideEffects() {
    side_effects_list = new int[10];
  }
  
  public int[] CountSideEffects(String[][] effects) {
    for (int m = 0; m < effects.length; m++) {
      if (effects[m][2].equals("Insomnia")) {
      Insomnia++;
      }
      if (effects[m][2].equals("Heart problems")) {
      Heart_problems++;
      }
      if (effects[m][2].equals("Dystonia")) {
      Dystonia++;
      }
      if (effects[m][2].equals("Fatigue")) {
      Fatigue++;
      }
      if (effects[m][2].equals("Aggression")) {
      Aggression++;
      }
      if (effects[m][2].equals("Dyspnoea")) {
      Dyspnoea++;
      }
      if (effects[m][2].equals("Incontinence")) {
      Incontinence++;
      }
      if (effects[m][2].equals("Anorexia")) {
      Anorexia++;
      }
      if (effects[m][2].equals("Pallor")) {
      Pallor++;
      }
      if (effects[m][2].equals(" ") || effects[m][2].equals("others")) {
      Inconclusive++;
      }
    } //End of for loop
    side_effects_list[0] = Insomnia;
    side_effects_list[1] = Heart_problems;
    side_effects_list[2] = Dystonia;
    side_effects_list[3] = Fatigue;
    side_effects_list[4] = Aggression;
    side_effects_list[5] = Dyspnoea;
    side_effects_list[6] = Incontinence;
    side_effects_list[7] = Anorexia;
    side_effects_list[8] = Pallor;
    side_effects_list[9] = Inconclusive;
    return side_effects_list;
  }
  
}

