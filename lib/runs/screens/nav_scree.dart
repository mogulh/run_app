import 'package:flutter/material.dart';
import 'package:run_app/env.dart';
import 'package:run_app/runs/screens/history_screen.dart';
import 'package:run_app/runs/screens/home.dart';
import 'package:run_app/runs/screens/run_screen.dart';
import 'package:run_app/runs/widgets/custom_tab.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<Widget> _screens = const [
    HomeScreen(),
    RunScreen(),
    HistoryScreen(),
    // NotificationScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.run_circle,
    Icons.history
    // Icons.notifications
  ];

  final List<String> titles = ["Home", "Run", "History"];

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          backgroundColor: Pallete.secColor,
          body: _screens.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              elevation: 0,
              showUnselectedLabels: false,
              currentIndex: selectedIndex,
              backgroundColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.run_circle_outlined), label: "run"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: "history"),
              ]),
        ));
  }
}
