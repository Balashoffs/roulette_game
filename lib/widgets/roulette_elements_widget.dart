import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roulette_game/widgets/privacy_policy_webview_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RouletteElementsWidget extends StatefulWidget {
  @override
  _RouletteElementsWidgetState createState() => _RouletteElementsWidgetState();
}

class _RouletteElementsWidgetState extends State<RouletteElementsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('SCORE: 50', style: TextStyle(color: Colors.red, fontSize: 25),),
          Image.asset('assets/images/cursor.jpg'),
          Image.asset('assets/images/roulette_wheel.jpg'),
          RaisedButton(child: Text('SPIN', style: TextStyle(color: Colors.red, fontSize: 25),),onPressed: ()=>{print("SPIN")},),
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
        ],
      ),
    );
  }
}
