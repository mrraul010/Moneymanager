import 'package:flutter/material.dart';
import 'package:moneymanagerhive/db/category/category_db.dart';
import 'package:moneymanagerhive/screens/category/expense_category_list.dart';
import 'package:moneymanagerhive/screens/category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orangeAccent,
            tabs: [
              Tab(text: 'INCOME'),
              Tab(
                text: 'EXPENSE',
              )
            ]),
        Expanded(
            child: TabBarView(controller: _tabController, children: const [
          IncomeCategoryList(),
          ExpenseCategoryList(),
        ]))
      ],
    );
  }
}
