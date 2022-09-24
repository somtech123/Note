import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/note_operation.dart';

import './screen/home_screen.dart';

import './models/notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Note';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteOperation>(
      create: ((context) => NoteOperation()),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: const TextStyle(
                      fontSize: 17,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal),
                  headline6: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  bodyText1: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato-Bold',
                    fontSize: 20,
                  ),
                  bodyText2: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 20,
                  ),
                ),
            fontFamily: 'Lato',
            canvasColor: const Color.fromARGB(255, 29, 27, 27),
            primarySwatch: Colors.amber),
        home: HomeScreen(),
      ),
    );
  }
}
