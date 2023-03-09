import 'dart:io';

import 'paigibigcontribution.dart';
import 'philhealthcontribution.dart';
import 'ssscontribution.dart';
import 'taxcontribution.dart';

void main(List<String> args) {

  promptUserToInputSalary();

  new pagibigcontribution(getGrossSalary());
  
  new philhealthcontribution(getGrossSalary());
  
  new ssscontribution(getGrossSalary());
  
  new taxcontribution(getGrossSalary());


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