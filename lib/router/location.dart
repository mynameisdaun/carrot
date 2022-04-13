import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jdu_carrot/screens/auth_screen.dart';
import 'package:jdu_carrot/screens/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, RouteInformationSerializable state) {
    return [BeamPage(child: HomeScreen(), key: ValueKey('home'))];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, RouteInformationSerializable state) {
    return [BeamPage(child: AuthScreen(), key: ValueKey('auth'))];
  }

  @override
  List<Pattern> get pathPatterns => ['/auth'];
}