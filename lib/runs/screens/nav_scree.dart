import 'package:flutter/material.dart';

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
    // Posts(),
    // MentScreen(),
    // QuestScreen(),
    // NotificationScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.supervisor_account_outlined,
    Icons.question_answer_outlined,
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
    return Container();
  }
}
