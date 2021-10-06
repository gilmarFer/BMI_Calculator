import 'package:bmi/model/results.dart';

class BMICalculate {
  static BMIResults calculate(double bmi) {
    if (bmi < 16) {
      return BMIResults('Severe Thinness', bmi, 'Less than 16', 'phrase');
    }
    if (bmi >= 16 && bmi < 17) {
      return BMIResults('Moderate Thinness', bmi, '16 - 17', 'phrase');
    }
    if (bmi >= 17 && bmi < 18.5) {
      return BMIResults('Mild Thinness', bmi, '17 - 18.5', 'phrase');
    }
    if (bmi >= 18.5 && bmi < 25) {
      return BMIResults('Normal', bmi, '18.5 - 25', 'phrase');
    }
    if (bmi >= 25 && bmi < 30) {
      return BMIResults('Overweight', bmi, '25 - 30', 'phrase');
    }
    if (bmi >= 30 && bmi < 35) {
      return BMIResults('Obese Class I', bmi, '30 - 35', 'phrase');
    }
    if (bmi >= 35 && bmi < 40) {
      return BMIResults('Obese Class II', bmi, '35 - 40', 'phrase');
    }
    if (bmi >= 40) {
      return BMIResults('Obese Class III', bmi, 'More than 46', 'phrase');
    }

    return BMIResults('Error', bmi, 'Error', 'Error');
  }
}
