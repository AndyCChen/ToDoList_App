import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TabItem {today, tomorrow}

const Map<TabItem, String> tabName = {
  TabItem.today: 'Today',
  TabItem.tomorrow: 'Tomorrow',
};

Map<TabItem, String> tabDate = {
  TabItem.today: DateFormat.yMMMd().format(DateTime.now()),
  TabItem.tomorrow: DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 1))),
};

Map<TabItem, Icon> tabIcon = {
  TabItem.today: const Icon(Icons.today,),
  TabItem.tomorrow: const Icon(Icons.arrow_forward,),
};
