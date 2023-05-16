import 'package:hw_mobiledevelopment_moneycontrol/bills/domain/entities/expenses_entity.dart';

class ExpensesModel {
  final String description;
  final double value;
  final String payment;

  const ExpensesModel(
      {required this.description, required this.value, required this.payment});

  factory ExpensesModel.fromMap(Map<String, dynamic> map) => ExpensesModel(
        description: map['description'],
        value: map['value'],
        payment: map['payment'],
      );

  ExpensesEntity toEntity() =>
      ExpensesEntity(description: description, value: value, payment: payment);
}
