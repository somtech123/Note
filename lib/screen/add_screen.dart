import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note_operation.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String titleText;
    late String descriptionText;
    final value = Provider.of<NoteOperation>(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                titleText = value;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Title',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  descriptionText = value;
                },
                autocorrect: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter descripion',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                value.addNewNote(
                    DateTime.now().toString(), titleText, descriptionText);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: const Text(
                'Add Note',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
