import 'dart:io';

void main(List<String> args) {

  print("========= SALARY CALCULATOR =========");
  print("\n");
  stdout.write("Input your gross monthly salary here: ");
  
  String? userGrossSalaryAmount = stdin.readLineSync();

  double grossSalaryAmount;

  RegExp regExp = new RegExp("\d[^.,]");

  if(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){
    while(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){
      print("\n[ERROR] Your did not provide any gross monthly salary.");
      stdout.write("Input your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
    }
  }

  if(regExp.hasMatch(userGrossSalaryAmount)){
    String userInput = userGrossSalaryAmount;
    while(regExp.hasMatch(userInput)){
      print('\n[ERROR] You provided an invalid amount: $userGrossSalaryAmount');
      stdout.write("\nInput your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
      userInput = userGrossSalaryAmount.toString();
    }
  }

  grossSalaryAmount = double.parse(userGrossSalaryAmount.toString());
  print("Gross salary: " + grossSalaryAmount.toStringAsFixed(2));
  
}