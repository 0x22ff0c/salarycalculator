import 'dart:io';

void main(List<String> args) {

  print("========= SALARY CALCULATOR =========");
  print("\n");
  stdout.write("Input your gross monthly salary here: ");
  
  String? userGrossSalaryAmount = stdin.readLineSync();

  double grossSalaryAmount;

  RegExp regExp = new RegExp("\\D");

  if(userGrossSalaryAmount == null || userGrossSalaryAmount == ""){

    print("\n[ERROR] You did not input any gross salary amount.");
    exit(0);

  }else if (regExp.hasMatch(userGrossSalaryAmount)){

    print("\n[ERROR] Your input contains an invalid numeric character.");
    print("\n[Error] Your input: " + userGrossSalaryAmount);
    exit(0);

  }else{

    grossSalaryAmount = double.parse(userGrossSalaryAmount);
    print("Gross salary: " + grossSalaryAmount.toStringAsFixed(2));

  }
  
  // String sample = "10000";

  // RegExp regularExpressions = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  // String Function(Match) matchFunction = (Match match) => '${match[1]},';

  // double sampledouble = double.parse(sample);

  // sample = sampledouble.toStringAsFixed(2);

  // sample = sample.replaceAllMapped(regularExpressions, matchFunction);

  // print(sample);

}