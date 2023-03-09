class taxcontribution{

  double grossSalaryAmount = 0.00;

  taxcontribution(double grossSalaryAmount){
    
     this.grossSalaryAmount = grossSalaryAmount;
     
     calculateAnnualGrossSalary();
     
     printAnnualGrossSalary();
     
     calculateContribution();
     
     printContribution();

  }

  double annualGrossSalary = 0.00;
  double taxContributionPerMonth = 0.00;
  double subtrahend = 0.00;
  double percentage = 0.00;

  void calculateAnnualGrossSalary(){
  
    annualGrossSalary = grossSalaryAmount * 12;
  
  }
  
  void calculateContribution(){

    if (annualGrossSalary > 250000.00 && annualGrossSalary < 400000.00){
      
      subtrahend = 250000.00;
      percentage = 0.15;
      taxContributionPerMonth = calculateContributionPerMonth();
      
    }else if (annualGrossSalary > 400000.00 && annualGrossSalary < 800000.00){

      subtrahend = 400000.00;
      percentage = 0.20;
      taxContributionPerMonth = calculateContributionPerMonth(fixedTax: 22500.00);
    
    }else if (annualGrossSalary > 800000.00 && annualGrossSalary < 2000000.00){

      subtrahend = 800000.00;
      percentage = 0.25;
      taxContributionPerMonth = calculateContributionPerMonth(fixedTax: 102500.00);
    
    }else if (annualGrossSalary > 2000000.00 && annualGrossSalary < 8000000.00){

      subtrahend = 2000000.00;
      percentage = 0.30;
      taxContributionPerMonth = calculateContributionPerMonth(fixedTax : 402500.00);

    }else if(annualGrossSalary > 8000000.00){

      subtrahend = 8000000.00;
      percentage = 0.35;
      taxContributionPerMonth = calculateContributionPerMonth(fixedTax : 2202500.00);
    
    }

  }

  double calculateContributionPerMonth({double fixedTax = 0.00}){

    return (fixedTax + (annualGrossSalary - subtrahend) * percentage ) / 12;
  }

  void printAnnualGrossSalary(){
    print("Annual gross salary: " + annualGrossSalary.toStringAsFixed(2));
  }

  void printContribution(){

    if(annualGrossSalary < 250000.00 || taxContributionPerMonth < 1.00){

      print("\nNo contribution for: Tax");
    
    }else{

      print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));

    }

  }

}