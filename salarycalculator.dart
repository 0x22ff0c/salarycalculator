import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {

  print("========= SALARY CALCULATOR =========");
  print("\n");
  stdout.write("Input your gross monthly salary here: ");
  
  String? userGrossSalaryAmount = stdin.readLineSync();

  double grossSalaryAmount;

  if(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){

    print("\nERROR: You did not input any gross salary amount.");
    exit(0);

  }else{

    grossSalaryAmount = double.parse(userGrossSalaryAmount);
    print("Gross salary: " + grossSalaryAmount.toStringAsPrecision(2));

  }
  
}