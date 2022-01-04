import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String detail;

  TodoModel({required this.name, required this.detail, this.id});
}