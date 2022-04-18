import 'package:flutter/material.dart';
import 'tab_item.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key, required this.currentTab, required this.selectedTab}) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> selectedTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildItem(TabItem.today),
        _buildItem(TabItem.tomorrow),
      ],
      onTap: (index) => selectedTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: tabIcon[tabItem] as Widget,
      label: tabName[tabItem],
    );
  }
}
