import 'package:flutter/material.dart';
import 'package:trailing_flutter/pages/navpages/bar_item_page.dart';
import 'package:trailing_flutter/pages/home_page.dart';
import 'package:trailing_flutter/pages/navpages/my_page.dart';
import 'package:trailing_flutter/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed, // this option can apply bg color (default: shifting)
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0, // prevent to click the below icons occurs an error
        unselectedFontSize: 0,
        elevation: 0, // hide navigator section bar line
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: 'Bar', icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'My', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
