import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/domain/entities/expenses_entity.dart';
import 'package:hw_mobiledevelopment_moneycontrol/bills/domain/use_cases/list_expenses.dart';

import '../models/expenses_model.dart';

class RemoteFetchExpenses extends ListExpenses {
  @override
  Future<List<ExpensesEntity>> execute() async {
    try {
      final uri = Uri.parse('https://demo5467968.mockable.io');

      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      final request = response.request.toString();
      final statusCode = response.statusCode;
      final headers = response.headers;
      final responseMessage = response.reasonPhrase;

      log('Response code: $statusCode', name: 'INFO');
      log('Response request: $request', name: 'INFO');
      log('Response headers: $headers', name: 'INFO');
      log('Response message: $responseMessage', name: 'INFO');
      // log('Response response: $responseJson', name: 'INFO');

      return responseJson['compras']
          .map<ExpensesEntity>((map) => ExpensesModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      log('List expenses error: $e', name: 'ERROR');
      return [];
    }
  }
}
