import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/notes_view.dart';
import 'package:notesapp/widgets/constants.dart';

void main() async {
  await Hive.initFlutter();
//وهنا بقولها يا هايف افتحي بوكس خزني فيه البيانات زي الكوليكشن ف البوست مان
 await Hive.openBox(kNotesBox);
 Hive.registerAdapter(NoteModelAdapter());
 //وبعرف الادابتر اللي هحطه بين القوسين من الموديل نوت جنريت اللي هو اسم الكلاس فيها
  runApp(const NotesApp());
}

  class NotesApp extends StatelessWidget {
    const NotesApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData( brightness: Brightness.dark ,
        fontFamily: 'Poppins'
        ),
         // theme: ThemeData.dark(), = theme: ThemeData(brightness: Brightness.dark, ) = theme: ThemeData(scaffoldBackgroundColor: Colors.black)
        home: const NotesView(),
      );
    }
  }

