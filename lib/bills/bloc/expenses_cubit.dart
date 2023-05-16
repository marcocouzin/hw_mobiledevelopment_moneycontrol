import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/data/use_cases/remote_list_expenses.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/domain/use_cases/list_expenses.dart';

import 'expenses_cubit_state.dart';

class ExpensesCubit extends Cubit<ExpensesCubitState> {
  ListExpenses listExpenses;

  ExpensesCubit(super.initialState, {required this.listExpenses});

  Future<void> search() async {
    final expensesList = await listExpenses.execute();
    emit(state.copyWith(expensesList: expensesList));
  }
}

class ExpensesCubitProvider extends BlocProvider<ExpensesCubit> {
  ExpensesCubitProvider({super.key, Widget? child})
      : super(
            create: (context) => ExpensesCubit(ExpensesCubitState(expensesList: []),
                listExpenses: RemoteFetchExpenses())
              ..search(),
            child: child);

  static ExpensesCubit of(BuildContext context) => BlocProvider.of(context);
}
