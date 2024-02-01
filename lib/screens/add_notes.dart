import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/screens/data.dart';

class Add_notes extends StatefulWidget {
  const Add_notes({super.key});

  @override
  State<Add_notes> createState() => _Add_notesState();
}

class _Add_notesState extends State<Add_notes> {
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                String sql =
                    "insert into Note values(null,'${description.text}')";
                database!.rawInsert(sql).then((value) {
                  print(value);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                  controller: description,
                  maxLines: 20,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter description")),
            )
          ],
        ),
      ),
    );
  }
}
