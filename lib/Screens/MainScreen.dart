import 'package:flutter/material.dart';

import 'History.dart';
import 'Second_Page.dart';
import 'UserInfo.dart';
import 'notifications.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectindex = 0;

  static const List<Widget> pages = [
    ListOfBox(),
    Notifications(),
    History(),
    ViewPage(),

    // Dashboard(),
    // MainPage(),
    // Mail_Verification(),
    // ViewPage(),

  ];

  void onItemTapped(int index) {
    setState(() {
      selectindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Colors.green,
        centerTitle: true, // Centers the title
        title: SizedBox(
          height: 210, // Adjust the height as needed
          width: 200,  // Adjust the width as needed
          child: Image.asset(
            'asset/images/logo2.png',
            fit: BoxFit.contain,
          ),
        ),
      ),

      body: pages[selectindex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: selectindex,
        onTap: onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),

    );
  }
}
