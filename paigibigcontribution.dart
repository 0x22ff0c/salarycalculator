class pagibigcontribution{

  double grossSalaryAmount = 0.00;
  double pagibigDeduction = 0.00;

  pagibigcontribution(double grossSalaryAmount){
      this.grossSalaryAmount = grossSalaryAmount;
      printContribution();
  }

  void calculateContribution(){

    if(grossSalaryAmount <= 1500.00){

      pagibigDeduction = grossSalaryAmount * 0.01;

    }else if (grossSalaryAmount > 1500.00 && grossSalaryAmount <= 5000.00){

      pagibigDeduction = grossSalaryAmount * 0.02;

    }else if (grossSalaryAmount > 5000.00){

      pagibigDeduction = 5000.00 * 0.02;

    }
    
  }

  void printContribution(){

    if(grossSalaryAmount <= 0.00){
    
      print("\nNo contribution for: Pag-IBIG");
    
    }else{
      
      calculateContribution();

      print("Pag-IBIG contribution: ${pagibigDeduction.toStringAsFixed(2)}");
    
    }

  }
}