public class Medication {
  int[] Medication_list;
  int Adderall;
  int Vyvanse;
  int Ritalin;
  
  public Medication() {
    Medication_list = new int[3];
  }
  
  public int[] CountMedication(String[][] medication) {
    for (int r = 0; r < medication.length; r++) {
      if (medication[r][0].equals("Adderall")) {
        Adderall++;
      }
      if (medication[r][0].equals("Vyvanse")) {
        Vyvanse++;
      }
      if (medication[r][0].equals("Ritalin")) {
        Ritalin++;
      }
    } //End of for loop
    Medication_list[0] = Adderall;
    Medication_list[1] = Vyvanse;
    Medication_list[2] = Ritalin;
    return Medication_list;
  }
  
}
