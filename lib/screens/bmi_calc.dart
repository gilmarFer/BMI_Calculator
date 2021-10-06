import 'package:bmi/screens/bmi_res.dart';
import 'package:bmi/widgets/btn_male_female.dart';
import 'package:bmi/widgets/btn_weight_age.dart';
import 'package:bmi/widgets/heigth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  _BMICalcState createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  bool male = true;
  double heigth = 183;
  int weigth = 74;
  int age = 19;

  _switchGenere() {
    setState(() {
      male = !male;
    });
  }

  _onChangeSliver(double value) {
    setState(() {
      heigth = value;
    });
  }

  _weightChange(bool value) {
    setState(() {
      value ? weigth++ : weigth--;
    });
  }

  _ageChange(bool value) {
    setState(() {
      value ? age++ : age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: const Color(0xff090C22),
        elevation: 10,
      ),
      body: Container(
        color: const Color(0xff090C22),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // children: const [BtnMaleFemale(LineIcons.mars, 'MALE')],
                  children: [
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          BtnMaleFemale(LineIcons.mars, 'MALE', male,
                              () => _switchGenere()),
                          const SizedBox(width: 8),
                          BtnMaleFemale(LineIcons.venus, 'FEMALE', !male,
                              () => _switchGenere()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      flex: 35,
                      child: HeigthSelector(heigth, _onChangeSliver),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      flex: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BtnWeightAge('WEIGHT', weigth, _weightChange),
                          const SizedBox(width: 8),
                          BtnWeightAge('AGE', age, _ageChange),
                        ],
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
                    double bmi = weigth / ((heigth / 100) * (heigth / 100));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIRes(bmi)));
                  },
                  child: const Text('CALCULATE YOUR BMI'),
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
