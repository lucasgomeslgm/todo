import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Coordinates for the robot's position
  double robotX = 0;
  double robotY = 0;

  // Whether the robot is currently dropping a bomb
  bool isDroppingBomb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            robotX += details.delta.dx;
            robotY += details.delta.dy;
          });
        },
        onLongPress: () {
          setState(() {
            isDroppingBomb = true;
          });
        },
        onLongPressUp: () {
          setState(() {
            isDroppingBomb = false;
          });
        },
        child: Stack(
          children: [
            // Display the robot at the updated position
            Positioned(
              left: robotX,
              top: robotY,
              child: Image.asset('assets/robot.png'),
            ),
            // Display a bomb at the robot's position if the robot is dropping a bomb
            isDroppingBomb
                ? Positioned(
                    left: robotX,
                    top: robotY,
                    child: Image.asset('assets/bomb.png'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}