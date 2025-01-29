import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({required this.title, required this.subject, required this.date});

  @HiveField(0)
  String title;

  @HiveField(1)
  String subject;

  @HiveField(2)
  DateTime date;
}
