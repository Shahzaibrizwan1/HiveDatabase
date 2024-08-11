import 'package:hive/hive.dart';
part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  // ye keys hoti ha
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  NotesModel({required this.title, required this.description});
}

//developers use vs code. When they go to generate the model should save the model by "ctrl+s" and then run the command "flutter packages pub run build_runner build"