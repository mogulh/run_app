import 'package:flutter/material.dart';
import 'package:run_app/env.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> titles;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      required this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Pallete.secColor,
      child: TabBar(
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex ? Colors.orange : Colors.black45,
                    size: 25.0,
                  ),
                  text: titles[i],
                )))
            .values
            .toList(),
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.black45,
        onTap: onTap,
      ),
    );
  }
}
