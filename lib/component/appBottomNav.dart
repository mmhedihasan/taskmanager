import 'package:flutter/material.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "New"),
      BottomNavigationBarItem(
          icon: Icon(Icons.access_time_rounded),
          label: "Progress"),
      BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: "Complete"),
      BottomNavigationBarItem(
          icon: Icon(Icons.cancel_outlined),
          label: "Cancel"),
    ],
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemTapped,
    type: BottomNavigationBarType.fixed,
  );
}
