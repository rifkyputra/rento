import 'package:rento/src/core/core.dart';

class TransactionService {
  final SqliteDatabase? sqliteDatabase;

  TransactionService(this.sqliteDatabase);

  get() => sqliteDatabase?.getRentTrx();
}
