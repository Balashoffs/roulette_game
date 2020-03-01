import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WheelWidget extends StatefulWidget {
  final Image image;

  WheelWidget(this.image);

  @override
  _WheelWidgetState createState() => _WheelWidgetState();
}

class _WheelWidgetState extends State<WheelWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  int duration = 10;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
    );
    _animation = Tween(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  void _start() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            'SCORE: 50',
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          SizedBox(height: 30),
          Image.asset('assets/images/cursor.png'),
          SizedBox(height: 30),
          Center(
            child: Container(
              child: AnimatedBuilder(
                  animation: _animation,
                  child: Container(child: widget.image),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value,
                      child: child,
                    );
                  }),
            ),
          ),
          SizedBox(height: 30),
          RaisedButton(
            child: Text(
              'SPIN',
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
            onPressed: _start,
          ),
      ],
    );
  }
}
