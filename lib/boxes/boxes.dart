import 'package:hive/hive.dart';
import 'package:sqflite/model/notes_model.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>("Notes");
  static Future<void> delete() => Hive.deleteFromDisk();
}
