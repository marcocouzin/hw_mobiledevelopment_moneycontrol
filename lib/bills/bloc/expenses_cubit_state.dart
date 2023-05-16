import '../domain/entities/expenses_entity.dart';

class ExpensesCubitState {
  final List<ExpensesEntity> expensesList;

  ExpensesCubitState({required this.expensesList});

  ExpensesCubitState copyWith({List<ExpensesEntity>? expensesList}) =>
      ExpensesCubitState(expensesList: expensesList ?? this.expensesList);
}
