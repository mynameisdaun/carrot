import 'package:flutter/material.dart';
import 'package:jdu_carrot/screens/start/address_page.dart';
import 'package:jdu_carrot/screens/start/auth_page.dart';
import 'package:jdu_carrot/screens/start/intro_page.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          IntroPage(_pageController),
          AddressPage(),
          AuthPage()
      ],),
    );
  }
}
