import 'dart:io';

import 'package:rento/src/core/core.dart';

class TransactionService {
  final SqliteDatabase? sqliteDatabase;

  TransactionService(this.sqliteDatabase);

  Future<List<RentTrx>> get() =>
      Platform.isAndroid || Platform.isIOS ? _getSqlite() : _getHive();

  _getHive() {}

  _getSqlite() {
    return sqliteDatabase?.getRentTrx();
  }
}
