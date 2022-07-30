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
  final int epoch;
  TimeScheme(
      {required this.id,
      required this.name,
      required this.durationMinutes,
      required this.start,
      required this.epoch});
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
      epoch: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}epoch'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['start'] = Variable<int>(start);
    map['epoch'] = Variable<int>(epoch);
    return map;
  }

  TimeDurationDefCompanion toCompanion(bool nullToAbsent) {
    return TimeDurationDefCompanion(
      id: Value(id),
      name: Value(name),
      durationMinutes: Value(durationMinutes),
      start: Value(start),
      epoch: Value(epoch),
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
      epoch: serializer.fromJson<int>(json['epoch']),
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
      'epoch': serializer.toJson<int>(epoch),
    };
  }

  TimeScheme copyWith(
          {String? id,
          String? name,
          int? durationMinutes,
          int? start,
          int? epoch}) =>
      TimeScheme(
        id: id ?? this.id,
        name: name ?? this.name,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        start: start ?? this.start,
        epoch: epoch ?? this.epoch,
      );
  @override
  String toString() {
    return (StringBuffer('TimeScheme(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('start: $start, ')
          ..write('epoch: $epoch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, durationMinutes, start, epoch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeScheme &&
          other.id == this.id &&
          other.name == this.name &&
          other.durationMinutes == this.durationMinutes &&
          other.start == this.start &&
          other.epoch == this.epoch);
}

class TimeDurationDefCompanion extends UpdateCompanion<TimeScheme> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> durationMinutes;
  final Value<int> start;
  final Value<int> epoch;
  const TimeDurationDefCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.start = const Value.absent(),
    this.epoch = const Value.absent(),
  });
  TimeDurationDefCompanion.insert({
    required String id,
    required String name,
    required int durationMinutes,
    required int start,
    required int epoch,
  })  : id = Value(id),
        name = Value(name),
        durationMinutes = Value(durationMinutes),
        start = Value(start),
        epoch = Value(epoch);
  static Insertable<TimeScheme> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? durationMinutes,
    Expression<int>? start,
    Expression<int>? epoch,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (start != null) 'start': start,
      if (epoch != null) 'epoch': epoch,
    });
  }

  TimeDurationDefCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? durationMinutes,
      Value<int>? start,
      Value<int>? epoch}) {
    return TimeDurationDefCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      start: start ?? this.start,
      epoch: epoch ?? this.epoch,
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
    if (epoch.present) {
      map['epoch'] = Variable<int>(epoch.value);
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
          ..write('epoch: $epoch')
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
  final VerificationMeta _epochMeta = const VerificationMeta('epoch');
  @override
  late final GeneratedColumn<int?> epoch = GeneratedColumn<int?>(
      'epoch', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, durationMinutes, start, epoch];
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
    if (data.containsKey('epoch')) {
      context.handle(
          _epochMeta, epoch.isAcceptableOrUnknown(data['epoch']!, _epochMeta));
    } else if (isInserting) {
      context.missing(_epochMeta);
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

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TimeDurationDefTable timeDurationDef =
      $TimeDurationDefTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timeDurationDef];
}
