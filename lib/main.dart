import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import "package:path_provider/path_provider.dart";
import 'package:sqflite/model/notes_model.dart';
import "package:sqflite/simple_addata.dart";

Future main() async {
  // Initialize Flutter Application
  WidgetsFlutterBinding.ensureInitialized();
  // path provider
  var directory = await getApplicationDocumentsDirectory();
  // hive database initialization
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>("notes");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hive Data"),
            ),
            body: Column(
              children: [],
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              _showDialog();
            })));
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Notes"),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Enter Title", border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      border: OutlineInputBorder()),
                )
              ],
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Add"))
            ],
          );
        });
  }
}
