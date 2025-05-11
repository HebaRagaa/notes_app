

 import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_bottom_sheet.dart';
import 'package:notesapp/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
   const NotesView({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       floatingActionButton: FloatingActionButton(
         shape: const CircleBorder(),
         backgroundColor: Colors.cyan ,
         onPressed: ()
         {
           showModalBottomSheet(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16)
             ),
               context: context,
               builder: (context) {
             return const AddNoteBottomSheet();
               });
         },
       child: const Icon(Icons.add,color: Colors.black87,),
       ),
       body: const NotesViewBody(),

     );
   }
 }
