import 'package:flutter/material.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/domain/entities/expenses_entity.dart';

class ExpensesScreen extends StatelessWidget {
  static const String id = '/expenses_screen';

  final List<ExpensesEntity> expensesList;

  const ExpensesScreen({super.key, required this.expensesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Theme.of(context).primaryColor),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: expensesList.length,
          // The _ and __ is used when the variable is not used in the code
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final expense = expensesList[index];
            return Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            expense.value.toString(),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            expense.payment,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
