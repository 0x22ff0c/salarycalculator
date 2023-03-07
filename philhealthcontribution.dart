class philhealthcontribution{
  
  double philHealthDeduction = 0.00;
  double grossSalaryAmount = 0.00;

  philhealthcontribution(double grossSalaryAmount){
    this.grossSalaryAmount = grossSalaryAmount;
    printContribution();
  }

  /**
   * Philhealth contribution
   */
  void calculateContribution(){
    if (grossSalaryAmount <= 79999.99){

      philHealthDeduction = grossSalaryAmount *  0.04;

    }else if(grossSalaryAmount >= 80000.00){
    
      philHealthDeduction = 80000.00 * 0.04;

    }
  }

  void printContribution(){

    if(grossSalaryAmount <= 0.00){
      
      print("\nNo contribution for: PhilHealth");

    }else{

      calculateContribution();

      print("PhilHeatlh contribution: ${philHealthDeduction.toStringAsFixed(2)}");

    }

  }

}