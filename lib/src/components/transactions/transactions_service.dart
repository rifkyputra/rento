import 'package:rento/src/core/core.dart';
import 'package:rento/src/shared/models/models.dart';

class TransactionService {
  final SqliteDb? sqliteDatabase;

  TransactionService(this.sqliteDatabase);

  List<RentTrx> get() {
    final query = sqliteDatabase?.select('rent_trx');
    if (query == null) return [];

    return [for (var e in query) RentTrx.fromMap(e)];
  }
}
