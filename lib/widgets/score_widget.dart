import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int selected;

  ScoreWidget(this.selected);

  final Map<int, String> labels ={

    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  @override
  Widget build(BuildContext context) {
    return Text(
      '${labels[selected]}',
      style: TextStyle(color: Colors.red, fontSize: 25)
    );
  }
}
