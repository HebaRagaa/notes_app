import 'package:flutter/material.dart';
import 'package:notesapp/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

  class NotesApp extends StatelessWidget {
    const NotesApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
         // theme: ThemeData.dark(), = theme: ThemeData(brightness: Brightness.dark, ) = theme: ThemeData(scaffoldBackgroundColor: Colors.black)
        home: const NotesView(),
      );
    }
  }

