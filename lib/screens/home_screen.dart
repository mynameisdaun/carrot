import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/items_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomSelectedIndex,
        children: [
          ItemsPage(),
          Container(
            color: Colors.accents[3],
          ),
          Container(
            color: Colors.accents[6],
          ),
          Container(
            color: Colors.accents[9],
          )
        ],
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '정왕동',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.text_justify)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex == 0
                  ? 'assets/imgs/logo.png'
                  : 'assets/imgs/logo.png')),
              label: '홈'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex == 1
                  ? 'assets/imgs/logo.png'
                  : 'assets/imgs/logo.png')),
              label: '내 근처'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex == 2
                  ? 'assets/imgs/logo.png'
                  : 'assets/imgs/logo.png')),
              label: '채팅'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex == 3
                  ? 'assets/imgs/logo.png'
                  : 'assets/imgs/logo.png')),
              label: '내정보'),
        ],
        onTap: (index) {
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            setState(() {
              _bottomSelectedIndex = index;
            });
          });
        },
      ),
    );
  }
}
