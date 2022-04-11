import 'package:flutter/material.dart';
import 'package:jdu_carrot/splash_screen.dart';
import 'package:jdu_carrot/utils/logger.dart';

void main() {
  logger.d('carrot logger message');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          child: _splashLoadingWidget(snapshot),
          duration: Duration(milliseconds: 300),
        );
      },
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError) {
      print('error occur while loading.');
      return Text('Error occur');
    } else if (snapshot.hasData) {
      return carrotApp();
    } else {
      return SplashScreen();
    }
  }
}

class carrotApp extends StatelessWidget {
  const carrotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}




