

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/widgets/add_note_bottom_sheet.dart';
import 'package:notesapp/widgets/constants.dart';
import 'package:notesapp/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
   const NotesView({super.key});

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
         create: (context) => NotesCubit(),
      child: Scaffold(
       floatingActionButton: FloatingActionButton(
         shape: const CircleBorder(),
         backgroundColor: kPrimaryColor ,
         onPressed: ()
         {
           showModalBottomSheet(
             isScrollControlled: true,
             //ودي عشان تسمح اني اعمل اسكرول جوه البوتوم شيت لما اضيف نوت
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
      )
     );
   }
 }
