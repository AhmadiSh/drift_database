import 'package:drift/drift.dart';
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text()();
}