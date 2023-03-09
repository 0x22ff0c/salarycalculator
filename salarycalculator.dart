import 'dart:io';

import 'paigibigcontribution.dart';
import 'philhealthcontribution.dart';
import 'ssscontribution.dart';

void main(List<String> args) {

  promptUserToInputSalary();

  new pagibigcontribution(getGrossSalary());
  
  new philhealthcontribution(getGrossSalary());
  
  new ssscontribution(getGrossSalary());
  
  calculateTaxContribution(getGrossSalary());

}

void promptUserToInputSalary(){

  String userInput = "";

  print("========= SALARY CALCULATOR =========");
  print("\n");

  String? userGrossSalaryAmount;

  double grossSalaryAmount;

  RegExp regExpUserInput = new RegExp("\d[^.,]");

  if(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){

  stdout.write("Input your gross monthly salary here: ");
  
  userGrossSalaryAmount = stdin.readLineSync();

    while(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){
      print("\n[ERROR] Your did not provide any gross monthly salary.");
      stdout.write("Input your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
    }
    userInput = userGrossSalaryAmount.replaceAll(RegExp(","), "");
  }

  if(regExpUserInput.hasMatch(userGrossSalaryAmount)){
    userInput = userGrossSalaryAmount;
    while(regExpUserInput.hasMatch(userInput)){
      print('\n[ERROR] You provided an invalid amount: $userGrossSalaryAmount');
      stdout.write("\nInput your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
      userInput = userGrossSalaryAmount.toString();
    }
  }

  RegExp regExpFormattedNumber = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match match) matchFunction = (Match match) => '${match[1]},';

  grossSalaryAmount = double.parse(userInput);
  setGrossSalary(grossSalaryAmount);
  
  userGrossSalaryAmount = grossSalaryAmount.toStringAsFixed(2);
  
  userGrossSalaryAmount = userGrossSalaryAmount.toString().replaceAllMapped(regExpFormattedNumber, matchFunction);
  
  print("Gross salary: " + userGrossSalaryAmount);

}

double grossSalary = 0.00;

void setGrossSalary(double userGrossSalary){
  grossSalary = userGrossSalary;
}

double getGrossSalary(){
  return grossSalary;
}

void calculateTaxContribution(double grossSalaryAmount){
    /**
     * Tax contribution
     */

    double taxContributionPerMonth;
    double annualGrossSalary = grossSalaryAmount * 12;
    double subtrahend;

    print("Annual gross salary: " + annualGrossSalary.toStringAsFixed(2));

    if(annualGrossSalary < 250000.00){

      print("\nNo contribution for: Tax");
    
    }else if (annualGrossSalary > 250000.00 && annualGrossSalary < 400000.00){
      
      subtrahend = 250000.00;
      taxContributionPerMonth = ((annualGrossSalary - subtrahend) * 0.15) / 12;
      
      if(taxContributionPerMonth < 1.00){
        print("\nNo contribution for: Tax");
      }else{
        print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));
      }

    }else if (annualGrossSalary > 400000.00 && annualGrossSalary < 800000.00){

      subtrahend = 400000.00;
      taxContributionPerMonth = (22500.00 + (annualGrossSalary - subtrahend) * 0.20) / 12;
      print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));
    
    }else if (annualGrossSalary > 800000.00 && annualGrossSalary < 2000000.00){

      subtrahend = 800000.00;
      taxContributionPerMonth = (102500.00 + (annualGrossSalary - subtrahend) * 0.25) / 12;
      print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));
    
    }else if (annualGrossSalary > 2000000.00 && annualGrossSalary < 8000000.00){

      subtrahend = 2000000.00;
      taxContributionPerMonth = (402500.00 + (annualGrossSalary - subtrahend) * 0.30) / 12;
      print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));

    }else if(annualGrossSalary > 8000000.00){

      subtrahend = 8000000.00;
      taxContributionPerMonth = (2202500.00 + (annualGrossSalary - subtrahend) * 0.35) / 12;
      print("Tax Contribution: " + taxContributionPerMonth.toStringAsFixed(2));

    }
}