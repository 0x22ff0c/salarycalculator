import 'dart:io';

void main(List<String> args) {

  print("========= SALARY CALCULATOR =========");
  print("\n");
  stdout.write("Input your gross monthly salary here: ");
  
  String? userGrossSalaryAmount = stdin.readLineSync();

  double grossSalaryAmount;

  RegExp regExpUserInput = new RegExp("\d[^.,]");

  if(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){
    while(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){
      print("\n[ERROR] Your did not provide any gross monthly salary.");
      stdout.write("Input your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
    }
  }

  if(regExpUserInput.hasMatch(userGrossSalaryAmount)){
    String userInput = userGrossSalaryAmount;
    while(regExpUserInput.hasMatch(userInput)){
      print('\n[ERROR] You provided an invalid amount: $userGrossSalaryAmount');
      stdout.write("\nInput your gross monthly salary here: ");
      userGrossSalaryAmount = stdin.readLineSync();
      userInput = userGrossSalaryAmount.toString();
    }
  }

  RegExp regExpFormattedNumber = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match match) matchFunction = (Match match) => '${match[1]},'; 

  grossSalaryAmount = double.parse(userGrossSalaryAmount.toString());
  
  userGrossSalaryAmount = grossSalaryAmount.toStringAsFixed(2);
  
  userGrossSalaryAmount = userGrossSalaryAmount.toString().replaceAllMapped(regExpFormattedNumber, matchFunction);

  print("Gross salary: " + userGrossSalaryAmount);

  double pagibigDeduction;


  if (grossSalaryAmount <= 0.00){

    print("\nNo contribution for: Pag-IBIG");
  
  }else if(grossSalaryAmount <= 1500.00){

    pagibigDeduction = grossSalaryAmount * 0.01;

    print("Pag-IBIG contribution: " + pagibigDeduction.toStringAsFixed(2));

  }else if (grossSalaryAmount > 1500.00 && grossSalaryAmount <= 5000.00){

    pagibigDeduction = grossSalaryAmount * 0.02;

    print("Pag-IBIG contribution: " + pagibigDeduction.toStringAsFixed(2));

  }else if (grossSalaryAmount > 5000.00){

    pagibigDeduction = 5000.00 * 0.02;

    print("Pag-IBIG contribution " + pagibigDeduction.toStringAsFixed(2));

  }

  double philHealthDeduction;

  if(grossSalaryAmount <= 0.00){
    
    print("\nNo contribution for: PhilHealth");

  }else if (grossSalaryAmount <= 79999.99){

    philHealthDeduction = grossSalaryAmount *  0.04;
  
    print("PhilHeatlh contribution: " + philHealthDeduction.toStringAsFixed(2));

  }else if(grossSalaryAmount >= 80000.00){
  
    philHealthDeduction = 80000.00 * 0.04;
  
    print("PhilHealth contribution: " + philHealthDeduction.toStringAsFixed(2));

  }
  
}