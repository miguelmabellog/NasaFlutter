// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteApodTable extends FavoriteApod
    with TableInfo<$FavoriteApodTable, FavoriteApodData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteApodTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _copyrightMeta = const VerificationMeta(
    'copyright',
  );
  @override
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
    'copyright',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hdurlMeta = const VerificationMeta('hdurl');
  @override
  late final GeneratedColumn<String> hdurl = GeneratedColumn<String>(
    'hdurl',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaTypeMeta = const VerificationMeta(
    'mediaType',
  );
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
    'media_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    copyright,
    date,
    explanation,
    hdurl,
    mediaType,
    title,
    url,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_apod';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteApodData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('copyright')) {
      context.handle(
        _copyrightMeta,
        copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta),
      );
    } else if (isInserting) {
      context.missing(_copyrightMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('hdurl')) {
      context.handle(
        _hdurlMeta,
        hdurl.isAcceptableOrUnknown(data['hdurl']!, _hdurlMeta),
      );
    } else if (isInserting) {
      context.missing(_hdurlMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(
        _mediaTypeMeta,
        mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteApodData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteApodData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      copyright: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}copyright'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      hdurl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hdurl'],
      )!,
      mediaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $FavoriteApodTable createAlias(String alias) {
    return $FavoriteApodTable(attachedDatabase, alias);
  }
}

class FavoriteApodData extends DataClass
    implements Insertable<FavoriteApodData> {
  final int id;
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String title;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const FavoriteApodData({
    required this.id,
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.title,
    required this.url,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['copyright'] = Variable<String>(copyright);
    map['date'] = Variable<String>(date);
    map['explanation'] = Variable<String>(explanation);
    map['hdurl'] = Variable<String>(hdurl);
    map['media_type'] = Variable<String>(mediaType);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FavoriteApodCompanion toCompanion(bool nullToAbsent) {
    return FavoriteApodCompanion(
      id: Value(id),
      copyright: Value(copyright),
      date: Value(date),
      explanation: Value(explanation),
      hdurl: Value(hdurl),
      mediaType: Value(mediaType),
      title: Value(title),
      url: Value(url),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FavoriteApodData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteApodData(
      id: serializer.fromJson<int>(json['id']),
      copyright: serializer.fromJson<String>(json['copyright']),
      date: serializer.fromJson<String>(json['date']),
      explanation: serializer.fromJson<String>(json['explanation']),
      hdurl: serializer.fromJson<String>(json['hdurl']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'copyright': serializer.toJson<String>(copyright),
      'date': serializer.toJson<String>(date),
      'explanation': serializer.toJson<String>(explanation),
      'hdurl': serializer.toJson<String>(hdurl),
      'mediaType': serializer.toJson<String>(mediaType),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  FavoriteApodData copyWith({
    int? id,
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? title,
    String? url,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => FavoriteApodData(
    id: id ?? this.id,
    copyright: copyright ?? this.copyright,
    date: date ?? this.date,
    explanation: explanation ?? this.explanation,
    hdurl: hdurl ?? this.hdurl,
    mediaType: mediaType ?? this.mediaType,
    title: title ?? this.title,
    url: url ?? this.url,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  FavoriteApodData copyWithCompanion(FavoriteApodCompanion data) {
    return FavoriteApodData(
      id: data.id.present ? data.id.value : this.id,
      copyright: data.copyright.present ? data.copyright.value : this.copyright,
      date: data.date.present ? data.date.value : this.date,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      hdurl: data.hdurl.present ? data.hdurl.value : this.hdurl,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteApodData(')
          ..write('id: $id, ')
          ..write('copyright: $copyright, ')
          ..write('date: $date, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    copyright,
    date,
    explanation,
    hdurl,
    mediaType,
    title,
    url,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteApodData &&
          other.id == this.id &&
          other.copyright == this.copyright &&
          other.date == this.date &&
          other.explanation == this.explanation &&
          other.hdurl == this.hdurl &&
          other.mediaType == this.mediaType &&
          other.title == this.title &&
          other.url == this.url &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FavoriteApodCompanion extends UpdateCompanion<FavoriteApodData> {
  final Value<int> id;
  final Value<String> copyright;
  final Value<String> date;
  final Value<String> explanation;
  final Value<String> hdurl;
  final Value<String> mediaType;
  final Value<String> title;
  final Value<String> url;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const FavoriteApodCompanion({
    this.id = const Value.absent(),
    this.copyright = const Value.absent(),
    this.date = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FavoriteApodCompanion.insert({
    this.id = const Value.absent(),
    required String copyright,
    required String date,
    required String explanation,
    required String hdurl,
    required String mediaType,
    required String title,
    required String url,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : copyright = Value(copyright),
       date = Value(date),
       explanation = Value(explanation),
       hdurl = Value(hdurl),
       mediaType = Value(mediaType),
       title = Value(title),
       url = Value(url);
  static Insertable<FavoriteApodData> custom({
    Expression<int>? id,
    Expression<String>? copyright,
    Expression<String>? date,
    Expression<String>? explanation,
    Expression<String>? hdurl,
    Expression<String>? mediaType,
    Expression<String>? title,
    Expression<String>? url,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (copyright != null) 'copyright': copyright,
      if (date != null) 'date': date,
      if (explanation != null) 'explanation': explanation,
      if (hdurl != null) 'hdurl': hdurl,
      if (mediaType != null) 'media_type': mediaType,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FavoriteApodCompanion copyWith({
    Value<int>? id,
    Value<String>? copyright,
    Value<String>? date,
    Value<String>? explanation,
    Value<String>? hdurl,
    Value<String>? mediaType,
    Value<String>? title,
    Value<String>? url,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return FavoriteApodCompanion(
      id: id ?? this.id,
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (hdurl.present) {
      map['hdurl'] = Variable<String>(hdurl.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteApodCompanion(')
          ..write('id: $id, ')
          ..write('copyright: $copyright, ')
          ..write('date: $date, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteApodTable favoriteApod = $FavoriteApodTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteApod];
}

typedef $$FavoriteApodTableCreateCompanionBuilder =
    FavoriteApodCompanion Function({
      Value<int> id,
      required String copyright,
      required String date,
      required String explanation,
      required String hdurl,
      required String mediaType,
      required String title,
      required String url,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$FavoriteApodTableUpdateCompanionBuilder =
    FavoriteApodCompanion Function({
      Value<int> id,
      Value<String> copyright,
      Value<String> date,
      Value<String> explanation,
      Value<String> hdurl,
      Value<String> mediaType,
      Value<String> title,
      Value<String> url,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$FavoriteApodTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteApodTable> {
  $$FavoriteApodTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteApodTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteApodTable> {
  $$FavoriteApodTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteApodTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteApodTable> {
  $$FavoriteApodTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get copyright =>
      $composableBuilder(column: $table.copyright, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hdurl =>
      $composableBuilder(column: $table.hdurl, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FavoriteApodTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteApodTable,
          FavoriteApodData,
          $$FavoriteApodTableFilterComposer,
          $$FavoriteApodTableOrderingComposer,
          $$FavoriteApodTableAnnotationComposer,
          $$FavoriteApodTableCreateCompanionBuilder,
          $$FavoriteApodTableUpdateCompanionBuilder,
          (
            FavoriteApodData,
            BaseReferences<_$AppDatabase, $FavoriteApodTable, FavoriteApodData>,
          ),
          FavoriteApodData,
          PrefetchHooks Function()
        > {
  $$FavoriteApodTableTableManager(_$AppDatabase db, $FavoriteApodTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteApodTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteApodTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteApodTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> copyright = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String> hdurl = const Value.absent(),
                Value<String> mediaType = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => FavoriteApodCompanion(
                id: id,
                copyright: copyright,
                date: date,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                title: title,
                url: url,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String copyright,
                required String date,
                required String explanation,
                required String hdurl,
                required String mediaType,
                required String title,
                required String url,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => FavoriteApodCompanion.insert(
                id: id,
                copyright: copyright,
                date: date,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                title: title,
                url: url,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteApodTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteApodTable,
      FavoriteApodData,
      $$FavoriteApodTableFilterComposer,
      $$FavoriteApodTableOrderingComposer,
      $$FavoriteApodTableAnnotationComposer,
      $$FavoriteApodTableCreateCompanionBuilder,
      $$FavoriteApodTableUpdateCompanionBuilder,
      (
        FavoriteApodData,
        BaseReferences<_$AppDatabase, $FavoriteApodTable, FavoriteApodData>,
      ),
      FavoriteApodData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteApodTableTableManager get favoriteApod =>
      $$FavoriteApodTableTableManager(_db, _db.favoriteApod);
}
