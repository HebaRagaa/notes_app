

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({super.key, required this.note});

 final NoteModel note;
 //وبدل ماتفضل تقول تايتل وسب تايتل تاخد النوت موديل
  //يعني لو عندك شوية بيانات شبه كده بتحطهم ف موديل وتتعامل معاه هو بدل ماتكون كل واحده لحده
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: ()
       {
         Navigator.push(context, MaterialPageRoute(builder: (context)
         {
           return EditNoteView(
          note: note,
           );
         }),
         );
       },
       child: Container(
     padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
       decoration: BoxDecoration(
         color: Color(note.color),
         borderRadius: BorderRadius.circular(16),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         //عشان اخلي التاريخ ف جنب الكونتينر ف الاخر
         children: [
      ListTile(
        title: Text(
           note.title,
          style: const TextStyle(color: Colors.black ,
          fontSize: 26),
         ),

        subtitle: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16, right: 3),
          child: Text(
       note.subTitle,
        style: const TextStyle(color: Colors.black38 ,
        fontSize: 17 ),
          ),
        ),
        trailing: Transform.translate(
          offset: Offset(0, -20), // السالب يعني لفوق
       child:  IconButton(
         onPressed: () {
           note.delete();

           BlocProvider.of<NotesCubit>(context).fetchAllNotes();
           //وهنا بعمل ريفريش للنوتس بعد الديليت عشان تظهر ع طول الليسته الجديده بالفيتش
         } ,
            icon: Icon(
            FontAwesomeIcons.trash,
            color: Colors.black,
            size: 22,
            ),
        ),
      ),
      ),

           Padding(
             padding: EdgeInsets.only(right: 24),
          child: Text(
          note.date,
           style: TextStyle(color: Colors.black45,
           fontSize: 16
           ),)
           )
         ],
       ),
       )
     );
   }
 }
