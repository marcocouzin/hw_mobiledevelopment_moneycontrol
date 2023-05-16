import '../entities/expenses_entity.dart';

abstract class ListExpenses {
  Future<List<ExpensesEntity>> execute();
}
