import 'package:flutter_todo_material/data/entity/todo.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'local_repository.g.dart';

@UseMoor(tables: [ToDo])
class LocalRepository extends _$LocalRepository {
  LocalRepository()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "todo_db.sqlite", logStatements: true));

  @override
  int get schemaVersion => 1;

  Stream<List<ToDoData>> watchAllToDo() => select(toDo).watch();
  Future insertToDo(ToDoCompanion toDoData) => into(toDo).insert(toDoData);
  Future updateToDo(ToDoCompanion toDoData) => update(toDo).replace(toDoData);
}
