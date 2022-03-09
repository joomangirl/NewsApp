import 'package:flutter/material.dart';

class natega extends StatelessWidget {
  final double grade;
  final gender;
  final double age;

  const natega(
      {@required this.grade, @required this.gender, @required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender : ${gender ? 'Male': 'Female'} '
                  '\n Result  : ${grade.round()} '
                  '\n Age      : ${age.round()} ',style: TextStyle(
                fontSize: 40
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
