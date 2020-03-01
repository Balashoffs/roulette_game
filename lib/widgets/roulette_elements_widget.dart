import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roulette_game/widgets/privacy_policy_webview_widget.dart';
import 'package:roulette_game/widgets/wheel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RouletteElementsWidget extends StatefulWidget {

  @override
  _RouletteElementsWidgetState createState() => _RouletteElementsWidgetState();
}

class _RouletteElementsWidgetState extends State<RouletteElementsWidget> {
  WheelWidget wheelWidget;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        wheelWidget,
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
    );
  }

  @override
  void initState() {
    super.initState();
    Image wheel = Image.asset('assets/images/roulette_wheel.png');
    wheelWidget = WheelWidget(
      wheel,
    );
  }
}
