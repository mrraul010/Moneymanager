import 'package:flutter/material.dart';
import 'package:moneymanagerhive/screens/home/screen_home.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: updatedIndex,
          onTap: (newindex) {
            ScreenHome.selectedIndexNotifier.value = newindex;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'Categories'),
          ],
        );
      },
    );
  }
}
