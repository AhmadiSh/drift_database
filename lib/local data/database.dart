import 'package:drift/drift.dart';
import 'package:drift_database/local%20data/connection/connection.dart' as imp;
import 'package:drift_database/local%20data/tables/category_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Categories],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(imp.connect());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        /*  if (from < 2) {
            await m.addColumn(messages, messages.replyName);
            await m.addColumn(messages, messages.replyMessage);
            await m.addColumn(messages, messages.replyType);
            await m.addColumn(messages, messages.status);
            await m.addColumn(messages, messages.userChat);
            await m.addColumn(messages, messages.isActive);
            await m.addColumn(chats, chats.isActive);
            await m.addColumn(chats, chats.isBlock);
            await m.alterTable(TableMigration(messages));

          }*/
      },
    );
  }


  Stream<List<Category>> getCategoriesStream() {
    return (select(categories)).watch();
  }


  Future<int> insertCategory(Category entity)async {
    return await into(categories).insertOnConflictUpdate(entity);
  }

}
