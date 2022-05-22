import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:jdu_carrot/router/location.dart';
import 'package:jdu_carrot/screens/splash_screen.dart';
import 'package:jdu_carrot/screens/start_screen.dart';
import 'package:jdu_carrot/states/user_provider.dart';
import 'package:jdu_carrot/utils/logger.dart';
import 'package:provider/provider.dart';

final _routerDelegate = BeamerDelegate (
    guards: [
      BeamGuard(
          pathBlueprints: ['/'],
          check: (context, location) {
            return context.watch<UserProvider>().userState;
            //return true;
          },
          showPage: BeamPage(child: StartScreen())
      )],
    locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()]
    )
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(microseconds: 300), () => 100),
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
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) {
        return UserProvider();
        },
      child: MaterialApp.router(
        theme: ThemeData(
            primarySwatch: Colors.red,
            fontFamily: 'DoHyeon',
            hintColor: Colors.grey[35],
            textTheme: TextTheme(headline3: TextStyle(fontFamily: 'DoHyeon'), button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(backgroundColor: Colors.white, titleTextStyle: TextStyle(color: Colors.black87), actionsIconTheme: IconThemeData(color:Colors.black87)),
            textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white, minimumSize: Size(48, 48)))
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}




