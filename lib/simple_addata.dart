import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SimpleData extends StatefulWidget {
  const SimpleData({super.key});

  @override
  State<SimpleData> createState() => _SimpleDataState();
}

class _SimpleDataState extends State<SimpleData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: Hive.openBox("name"),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(snapshot.data!.get('name').toString()),
                  Text(snapshot.data!.get('hi').toString()),
                  Text(snapshot.data!.get('details').toString()),
                  // Text(snapshot.data?.get('hi')?? 'No Data'),
                  // Text(snapshot.data?.get('details')['pro']?? 'No Data'),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        var box = await Hive.openBox("name");
        box.put("name", "shahzaib");
        box.put("hi", "shah  zaib");
        box.put("details", {
          "pro": "developer",
          "pros": "sdsd",
        });
        print(box.get('keys'));
      }),
    );
  }
}
