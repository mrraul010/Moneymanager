import 'package:flutter/material.dart';
import 'package:moneymanagerhive/screens/add_transaction/screen_add_transaction.dart';
import 'package:moneymanagerhive/screens/category/category_add_popup.dart';
import 'package:moneymanagerhive/screens/category/screen_category.dart';
import 'package:moneymanagerhive/screens/home/widgets/bottom_navigation.dart';
import 'package:moneymanagerhive/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[90],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.black,
        title: Text(
          'MoneyManager',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return _pages[updatedIndex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transaction');
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } else {
            print('Add Category');
            showCategoryAddPopup(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
