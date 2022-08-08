import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/components/transactions/transactions_service.dart';

class TransactionsProvider extends StateNotifier<List> {
  TransactionsProvider(this.service) : super([]);

  final TransactionService service;

  getAllTransactions() async {
    final result = await service.get();
    print(result);
    state = result;
  }
}
