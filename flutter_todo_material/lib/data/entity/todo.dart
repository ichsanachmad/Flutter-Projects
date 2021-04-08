import 'package:moor_flutter/moor_flutter.dart';

class ToDo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get isDone => boolean()();
  DateTimeColumn get createdDate => dateTime()();
}
