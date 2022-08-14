// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_driver.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TimeScheme extends DataClass implements Insertable<TimeScheme> {
  final String id;
  final String name;
  final int durationMinutes;
  final int start;
  final int end;
  TimeScheme(
      {required this.id,
      required this.name,
      required this.durationMinutes,
      required this.start,
      required this.end});
  factory TimeScheme.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TimeScheme(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      durationMinutes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}duration_minutes'])!,
      start: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start'])!,
      end: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['start'] = Variable<int>(start);
    map['end'] = Variable<int>(end);
    return map;
  }

  TimeDurationDefCompanion toCompanion(bool nullToAbsent) {
    return TimeDurationDefCompanion(
      id: Value(id),
      name: Value(name),
      durationMinutes: Value(durationMinutes),
      start: Value(start),
      end: Value(end),
    );
  }

  factory TimeScheme.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeScheme(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      start: serializer.fromJson<int>(json['start']),
      end: serializer.fromJson<int>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'start': serializer.toJson<int>(start),
      'end': serializer.toJson<int>(end),
    };
  }

  TimeScheme copyWith(
          {String? id,
          String? name,
          int? durationMinutes,
          int? start,
          int? end}) =>
      TimeScheme(
        id: id ?? this.id,
        name: name ?? this.name,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        start: start ?? this.start,
        end: end ?? this.end,
      );
  @override
  String toString() {
    return (StringBuffer('TimeScheme(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, durationMinutes, start, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeScheme &&
          other.id == this.id &&
          other.name == this.name &&
          other.durationMinutes == this.durationMinutes &&
          other.start == this.start &&
          other.end == this.end);
}

class TimeDurationDefCompanion extends UpdateCompanion<TimeScheme> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> durationMinutes;
  final Value<int> start;
  final Value<int> end;
  const TimeDurationDefCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  });
  TimeDurationDefCompanion.insert({
    required String id,
    required String name,
    required int durationMinutes,
    required int start,
    required int end,
  })  : id = Value(id),
        name = Value(name),
        durationMinutes = Value(durationMinutes),
        start = Value(start),
        end = Value(end);
  static Insertable<TimeScheme> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? durationMinutes,
    Expression<int>? start,
    Expression<int>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    });
  }

  TimeDurationDefCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? durationMinutes,
      Value<int>? start,
      Value<int>? end}) {
    return TimeDurationDefCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (start.present) {
      map['start'] = Variable<int>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<int>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeDurationDefCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

class $TimeDurationDefTable extends TimeDurationDef
    with TableInfo<$TimeDurationDefTable, TimeScheme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeDurationDefTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int?> durationMinutes = GeneratedColumn<int?>(
      'duration_minutes', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<int?> start = GeneratedColumn<int?>(
      'start', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<int?> end = GeneratedColumn<int?>(
      'end', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, durationMinutes, start, end];
  @override
  String get aliasedName => _alias ?? 'time_duration_def';
  @override
  String get actualTableName => 'time_duration_def';
  @override
  VerificationContext validateIntegrity(Insertable<TimeScheme> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TimeScheme map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TimeScheme.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TimeDurationDefTable createAlias(String alias) {
    return $TimeDurationDefTable(attachedDatabase, alias);
  }
}

class RentTrx extends DataClass implements Insertable<RentTrx> {
  final String id;
  final String title;
  final int? durationMinutes;
  final int? start;
  final int? end;
  final String? currency;
  final bool autoRepeat;
  final int? value;
  RentTrx(
      {required this.id,
      required this.title,
      this.durationMinutes,
      this.start,
      this.end,
      this.currency,
      required this.autoRepeat,
      this.value});
  factory RentTrx.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RentTrx(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      durationMinutes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}duration_minutes']),
      start: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start']),
      end: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end']),
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      autoRepeat: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}auto_repeat'])!,
      value: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int?>(durationMinutes);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<int?>(start);
    }
    if (!nullToAbsent || end != null) {
      map['end'] = Variable<int?>(end);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String?>(currency);
    }
    map['auto_repeat'] = Variable<bool>(autoRepeat);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int?>(value);
    }
    return map;
  }

  RentTrxDefCompanion toCompanion(bool nullToAbsent) {
    return RentTrxDefCompanion(
      id: Value(id),
      title: Value(title),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      end: end == null && nullToAbsent ? const Value.absent() : Value(end),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      autoRepeat: Value(autoRepeat),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory RentTrx.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RentTrx(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      start: serializer.fromJson<int?>(json['start']),
      end: serializer.fromJson<int?>(json['end']),
      currency: serializer.fromJson<String?>(json['currency']),
      autoRepeat: serializer.fromJson<bool>(json['autoRepeat']),
      value: serializer.fromJson<int?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'start': serializer.toJson<int?>(start),
      'end': serializer.toJson<int?>(end),
      'currency': serializer.toJson<String?>(currency),
      'autoRepeat': serializer.toJson<bool>(autoRepeat),
      'value': serializer.toJson<int?>(value),
    };
  }

  RentTrx copyWith(
          {String? id,
          String? title,
          Value<int?> durationMinutes = const Value.absent(),
          Value<int?> start = const Value.absent(),
          Value<int?> end = const Value.absent(),
          Value<String?> currency = const Value.absent(),
          bool? autoRepeat,
          Value<int?> value = const Value.absent()}) =>
      RentTrx(
        id: id ?? this.id,
        title: title ?? this.title,
        durationMinutes: durationMinutes.present
            ? durationMinutes.value
            : this.durationMinutes,
        start: start.present ? start.value : this.start,
        end: end.present ? end.value : this.end,
        currency: currency.present ? currency.value : this.currency,
        autoRepeat: autoRepeat ?? this.autoRepeat,
        value: value.present ? value.value : this.value,
      );
  @override
  String toString() {
    return (StringBuffer('RentTrx(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('currency: $currency, ')
          ..write('autoRepeat: $autoRepeat, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, durationMinutes, start, end, currency, autoRepeat, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RentTrx &&
          other.id == this.id &&
          other.title == this.title &&
          other.durationMinutes == this.durationMinutes &&
          other.start == this.start &&
          other.end == this.end &&
          other.currency == this.currency &&
          other.autoRepeat == this.autoRepeat &&
          other.value == this.value);
}

class RentTrxDefCompanion extends UpdateCompanion<RentTrx> {
  final Value<String> id;
  final Value<String> title;
  final Value<int?> durationMinutes;
  final Value<int?> start;
  final Value<int?> end;
  final Value<String?> currency;
  final Value<bool> autoRepeat;
  final Value<int?> value;
  const RentTrxDefCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.currency = const Value.absent(),
    this.autoRepeat = const Value.absent(),
    this.value = const Value.absent(),
  });
  RentTrxDefCompanion.insert({
    required String id,
    required String title,
    this.durationMinutes = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.currency = const Value.absent(),
    this.autoRepeat = const Value.absent(),
    this.value = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<RentTrx> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int?>? durationMinutes,
    Expression<int?>? start,
    Expression<int?>? end,
    Expression<String?>? currency,
    Expression<bool>? autoRepeat,
    Expression<int?>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (currency != null) 'currency': currency,
      if (autoRepeat != null) 'auto_repeat': autoRepeat,
      if (value != null) 'value': value,
    });
  }

  RentTrxDefCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int?>? durationMinutes,
      Value<int?>? start,
      Value<int?>? end,
      Value<String?>? currency,
      Value<bool>? autoRepeat,
      Value<int?>? value}) {
    return RentTrxDefCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      start: start ?? this.start,
      end: end ?? this.end,
      currency: currency ?? this.currency,
      autoRepeat: autoRepeat ?? this.autoRepeat,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int?>(durationMinutes.value);
    }
    if (start.present) {
      map['start'] = Variable<int?>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<int?>(end.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String?>(currency.value);
    }
    if (autoRepeat.present) {
      map['auto_repeat'] = Variable<bool>(autoRepeat.value);
    }
    if (value.present) {
      map['value'] = Variable<int?>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentTrxDefCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('currency: $currency, ')
          ..write('autoRepeat: $autoRepeat, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $RentTrxDefTable extends RentTrxDef
    with TableInfo<$RentTrxDefTable, RentTrx> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentTrxDefTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int?> durationMinutes = GeneratedColumn<int?>(
      'duration_minutes', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<int?> start = GeneratedColumn<int?>(
      'start', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<int?> end = GeneratedColumn<int?>(
      'end', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String?> currency = GeneratedColumn<String?>(
      'currency', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _autoRepeatMeta = const VerificationMeta('autoRepeat');
  @override
  late final GeneratedColumn<bool?> autoRepeat = GeneratedColumn<bool?>(
      'auto_repeat', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (auto_repeat IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int?> value = GeneratedColumn<int?>(
      'value', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, durationMinutes, start, end, currency, autoRepeat, value];
  @override
  String get aliasedName => _alias ?? 'rent_trx_def';
  @override
  String get actualTableName => 'rent_trx_def';
  @override
  VerificationContext validateIntegrity(Insertable<RentTrx> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('auto_repeat')) {
      context.handle(
          _autoRepeatMeta,
          autoRepeat.isAcceptableOrUnknown(
              data['auto_repeat']!, _autoRepeatMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  RentTrx map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RentTrx.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RentTrxDefTable createAlias(String alias) {
    return $RentTrxDefTable(attachedDatabase, alias);
  }
}

abstract class _$SqliteDatabase extends GeneratedDatabase {
  _$SqliteDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$SqliteDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $TimeDurationDefTable timeDurationDef =
      $TimeDurationDefTable(this);
  late final $RentTrxDefTable rentTrxDef = $RentTrxDefTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [timeDurationDef, rentTrxDef];
}
