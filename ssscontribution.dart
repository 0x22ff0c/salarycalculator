class ssscontribution{
  
  double grossSalaryAmount = 0.00;

  ssscontribution(double grossSalaryAmount){
    
    this.grossSalaryAmount = grossSalaryAmount;
    calculateContribution();
    printContribution();

  }

  double minSalaryForDeduction = 4000.00;
  double sssContribution = 0.00;

  void calculateContribution(){
  
    double minMaxSalaryForDeduction = 4249.99;
    double minSalaryForLastBracket = 29750.00;
    double lowerBracket;
    double upperBracket;
    double minContribution = 180.00;
    double incrementForMin = 0.01;
    double incrementForMax = 499.99;
    double incrementForContribution = 22.50;

    if (grossSalaryAmount >= minSalaryForLastBracket){
    
      sssContribution = 1350.00;

    }else if (grossSalaryAmount > minSalaryForDeduction){

      lowerBracket = minSalaryForDeduction;
      upperBracket = minMaxSalaryForDeduction;

      while(sssContribution == 0.00){

        if(grossSalaryAmount >= lowerBracket && grossSalaryAmount <= upperBracket){

          sssContribution = minContribution;

        }else{

          lowerBracket = upperBracket + incrementForMin;
          upperBracket = lowerBracket + incrementForMax;
          minContribution += incrementForContribution;

        }

      }

    }

  }

  void printContribution(){

    if(grossSalaryAmount < minSalaryForDeduction){
      
      print("\nNo contribution for: SSS");

    } 

    if(sssContribution > 0.00){

      print("SSS Contribution: " + sssContribution.toStringAsFixed(2));
    
    }

  }

}