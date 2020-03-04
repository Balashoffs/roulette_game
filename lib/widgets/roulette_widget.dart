import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roulette_game/widgets/privacy_policy_webview_widget.dart';
import 'package:roulette_game/widgets/score_widget.dart';
import 'package:roulette_game/widgets/spin_wheel_widget.dart';

class RouletteWidget extends StatelessWidget {

  final StreamController _dividerController = StreamController<int>();
  final StreamController _wheelNotifier = StreamController<double>();

  dispose(){
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        StreamBuilder(
          stream: _dividerController.stream,
          builder: ((context, snapshot) =>
            snapshot.hasData ? ScoreWidget(snapshot.data) : Container()
          ),
        ),
        SpinWheelWidget(
          Image.asset('assets/images/roulette-8-300.png'),
          width: 310,
          height: 310,
          initialSpinAngle: _generateRandomAngle(),
          spinResistance: 0.6,
          canInteractWhileSpinning: false,
          dividers: 6,
          onUpdate: _dividerController.add,
          onEnd: _dividerController.add,
          secondaryImage: Image.asset('assets/images/roulette-center-300.png'),
          shouldStartOrStop: _wheelNotifier.stream,
        ),
        SizedBox(height: 30,),
        Image.asset('assets/images/cursor.png'),
        SizedBox(height: 30,),
        SizedBox(height: 30,),
        RaisedButton(
          child: Text(
            'SPIN',
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          onPressed: () =>
            _wheelNotifier.sink.add(_generateRandomVelocity()),
        ),
        GestureDetector(
            child: Text("Privacy Police", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context)=>
                          PrivacyPolicesWebviewWidget(
                            title: 'Privacy Police',
                            url: 'https://www.privacypolicies.com/blog/privacy-policy-template/',
                          )
                  )
              );
            }
        ),
        SizedBox(height: 30),
      ],
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}
