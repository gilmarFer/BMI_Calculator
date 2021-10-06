import 'package:bmi/helpers/bmi_calc.dart';
import 'package:bmi/model/results.dart';
import 'package:flutter/material.dart';

class BMIRes extends StatelessWidget {
  const BMIRes(this.bmi, {Key? key}) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) {
    BMIResults bmiResults = BMICalculate.calculate(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: const Color(0xff090C22),
        elevation: 10,
      ),
      body: Container(
        width: double.infinity,
        // height: double.infinity,
        color: const Color(0xff090C22),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Your Result',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xff1D1F33),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              bmiResults.title.toString().toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: bmiResults.bmi < 18.5
                                    ? Colors.yellow
                                    : bmiResults.bmi < 25
                                        ? const Color(0xff3ED387)
                                        : Colors.red,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              bmiResults.bmi.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 70),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${bmiResults.title} BMI RANGE:',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8C8F9B),
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  bmiResults.media + ' kg/m2',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'You have a ${bmiResults.title} body weight!!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('RE-CALCULATE YOUR BMI'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      textStyle: const TextStyle(fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
