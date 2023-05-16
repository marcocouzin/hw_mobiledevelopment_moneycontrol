import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/ui/expenses_screen.dart';

import '../bloc/expenses_cubit.dart';
import '../bloc/expenses_cubit_state.dart';

class ExpensesContainer extends BlocBuilder<ExpensesCubit, ExpensesCubitState> {
  ExpensesContainer({super.key})
      : super(builder: (context, state) {
          return ExpensesScreen(
              expensesList: state.expensesList,
          );
        });
}
