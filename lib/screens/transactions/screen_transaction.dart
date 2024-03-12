import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:moneymanagerhive/db/category/category_db.dart';
import 'package:moneymanagerhive/db/transactions/transaction_db.dart';
import 'package:moneymanagerhive/models/category/category_model.dart';
import 'package:moneymanagerhive/models/transactions/transaction_model.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Slidable(
                  key: Key(_value.id!),
                  startActionPane:
                      ActionPane(motion: ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (ctx) {
                        TransactionDB.instance.deleteTransaction(_value.id!);
                      },
                      icon: Icons.delete_outline,
                    )
                  ]),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 50,
                        child: Text(
                          parseDate(_value.date),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: _value.type == CategoryType.income
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                      title: Text('Rs ${_value.amount}'),
                      subtitle: Text(_value.category.name),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(height: 10);
              },
              itemCount: newList.length);
        });
  }

  String parseDate(DateTime date) {
    return DateFormat.MMMd().format(date);
    // return '${date.day}\n${date.month}';
  }
}
