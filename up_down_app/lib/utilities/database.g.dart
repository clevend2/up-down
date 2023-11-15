// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Actions extends Table with TableInfo<Actions, UpDownAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Actions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<ActionType?, int> type =
      GeneratedColumn<int>('type', aliasedName, true,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<ActionType?>(Actions.$convertertypen);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumnWithTypeConverter<ActionLevel?, int> level =
      GeneratedColumn<int>('level', aliasedName, true,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<ActionLevel?>(Actions.$converterleveln);
  static const VerificationMeta _whatHappenedMeta =
      const VerificationMeta('whatHappened');
  late final GeneratedColumn<String> whatHappened = GeneratedColumn<String>(
      'whatHappened', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _talkAboutItMeta =
      const VerificationMeta('talkAboutIt');
  late final GeneratedColumn<String> talkAboutIt = GeneratedColumn<String>(
      'talkAboutIt', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deviceMeta = const VerificationMeta('device');
  late final GeneratedColumn<String> device = GeneratedColumn<String>(
      'device', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _tokenizedWhatHappenedMeta =
      const VerificationMeta('tokenizedWhatHappened');
  late final GeneratedColumn<String> tokenizedWhatHappened =
      GeneratedColumn<String>('tokenizedWhatHappened', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        level,
        whatHappened,
        talkAboutIt,
        timestamp,
        device,
        tokenizedWhatHappened
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actions';
  @override
  VerificationContext validateIntegrity(Insertable<UpDownAction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_levelMeta, const VerificationResult.success());
    if (data.containsKey('whatHappened')) {
      context.handle(
          _whatHappenedMeta,
          whatHappened.isAcceptableOrUnknown(
              data['whatHappened']!, _whatHappenedMeta));
    } else if (isInserting) {
      context.missing(_whatHappenedMeta);
    }
    if (data.containsKey('talkAboutIt')) {
      context.handle(
          _talkAboutItMeta,
          talkAboutIt.isAcceptableOrUnknown(
              data['talkAboutIt']!, _talkAboutItMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('device')) {
      context.handle(_deviceMeta,
          device.isAcceptableOrUnknown(data['device']!, _deviceMeta));
    }
    if (data.containsKey('tokenizedWhatHappened')) {
      context.handle(
          _tokenizedWhatHappenedMeta,
          tokenizedWhatHappened.isAcceptableOrUnknown(
              data['tokenizedWhatHappened']!, _tokenizedWhatHappenedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UpDownAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpDownAction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: Actions.$convertertypen.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])),
      level: Actions.$converterleveln.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])),
      whatHappened: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}whatHappened'])!,
      talkAboutIt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}talkAboutIt']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      device: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device']),
      tokenizedWhatHappened: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tokenizedWhatHappened']),
    );
  }

  @override
  Actions createAlias(String alias) {
    return Actions(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ActionType, int, int> $convertertype =
      const EnumIndexConverter<ActionType>(ActionType.values);
  static JsonTypeConverter2<ActionType?, int?, int?> $convertertypen =
      JsonTypeConverter2.asNullable($convertertype);
  static JsonTypeConverter2<ActionLevel, int, int> $converterlevel =
      const EnumIndexConverter<ActionLevel>(ActionLevel.values);
  static JsonTypeConverter2<ActionLevel?, int?, int?> $converterleveln =
      JsonTypeConverter2.asNullable($converterlevel);
  @override
  bool get dontWriteConstraints => true;
}

class ActionsCompanion extends UpdateCompanion<UpDownAction> {
  final Value<int> id;
  final Value<ActionType?> type;
  final Value<ActionLevel?> level;
  final Value<String> whatHappened;
  final Value<String?> talkAboutIt;
  final Value<DateTime> timestamp;
  final Value<String?> device;
  final Value<String?> tokenizedWhatHappened;
  const ActionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.level = const Value.absent(),
    this.whatHappened = const Value.absent(),
    this.talkAboutIt = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.device = const Value.absent(),
    this.tokenizedWhatHappened = const Value.absent(),
  });
  ActionsCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.level = const Value.absent(),
    required String whatHappened,
    this.talkAboutIt = const Value.absent(),
    required DateTime timestamp,
    this.device = const Value.absent(),
    this.tokenizedWhatHappened = const Value.absent(),
  })  : whatHappened = Value(whatHappened),
        timestamp = Value(timestamp);
  static Insertable<UpDownAction> custom({
    Expression<int>? id,
    Expression<int>? type,
    Expression<int>? level,
    Expression<String>? whatHappened,
    Expression<String>? talkAboutIt,
    Expression<DateTime>? timestamp,
    Expression<String>? device,
    Expression<String>? tokenizedWhatHappened,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (level != null) 'level': level,
      if (whatHappened != null) 'whatHappened': whatHappened,
      if (talkAboutIt != null) 'talkAboutIt': talkAboutIt,
      if (timestamp != null) 'timestamp': timestamp,
      if (device != null) 'device': device,
      if (tokenizedWhatHappened != null)
        'tokenizedWhatHappened': tokenizedWhatHappened,
    });
  }

  ActionsCompanion copyWith(
      {Value<int>? id,
      Value<ActionType?>? type,
      Value<ActionLevel?>? level,
      Value<String>? whatHappened,
      Value<String?>? talkAboutIt,
      Value<DateTime>? timestamp,
      Value<String?>? device,
      Value<String?>? tokenizedWhatHappened}) {
    return ActionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      level: level ?? this.level,
      whatHappened: whatHappened ?? this.whatHappened,
      talkAboutIt: talkAboutIt ?? this.talkAboutIt,
      timestamp: timestamp ?? this.timestamp,
      device: device ?? this.device,
      tokenizedWhatHappened:
          tokenizedWhatHappened ?? this.tokenizedWhatHappened,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      final converter = Actions.$convertertypen;

      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (level.present) {
      final converter = Actions.$converterleveln;

      map['level'] = Variable<int>(converter.toSql(level.value));
    }
    if (whatHappened.present) {
      map['whatHappened'] = Variable<String>(whatHappened.value);
    }
    if (talkAboutIt.present) {
      map['talkAboutIt'] = Variable<String>(talkAboutIt.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (device.present) {
      map['device'] = Variable<String>(device.value);
    }
    if (tokenizedWhatHappened.present) {
      map['tokenizedWhatHappened'] =
          Variable<String>(tokenizedWhatHappened.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('level: $level, ')
          ..write('whatHappened: $whatHappened, ')
          ..write('talkAboutIt: $talkAboutIt, ')
          ..write('timestamp: $timestamp, ')
          ..write('device: $device, ')
          ..write('tokenizedWhatHappened: $tokenizedWhatHappened')
          ..write(')'))
        .toString();
  }
}

abstract class _$UpDownDatabase extends GeneratedDatabase {
  _$UpDownDatabase(QueryExecutor e) : super(e);
  late final Actions actions = Actions(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [actions];
}
