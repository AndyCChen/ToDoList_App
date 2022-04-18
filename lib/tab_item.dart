import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TabItem {today, tomorrow}

const Map<TabItem, String> tabName = {
  TabItem.today: 'today',
  TabItem.tomorrow: 'tomorrow',
};

Map<TabItem, String> tabDate = {
  TabItem.today: DateFormat.yMMMd().format(DateTime.now()),
  TabItem.tomorrow: DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 1))),
};

Map<TabItem, Icon> tabIcon = {
  TabItem.today: const Icon(Icons.today, color: Color.fromRGBO(255, 72, 72, 1.0),),
  TabItem.tomorrow: const Icon(Icons.arrow_forward, color: Color.fromRGBO(255, 72, 72, 1.0),),
};
