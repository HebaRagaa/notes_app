

 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({super.key, required this.notes});

 final NoteModel notes;
 //وبدل ماتفضل تقول تايتل وسب تايتل تاخد النوت موديل
  //يعني لو عندك شوية بيانات شبه كده بتحطهم ف موديل وتتعامل معاه هو بدل ماتكون كل واحده لحده
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: ()
       {
         Navigator.push(context, MaterialPageRoute(builder: (context)
         {
           return  const EditNoteView();
         }),
         );
       },
       child: Container(
     padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
       decoration: BoxDecoration(
         color: Color(notes.color),
         borderRadius: BorderRadius.circular(16),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         //عشان اخلي التاريخ ف جنب الكونتينر ف الاخر
         children: [
      ListTile(
        title: Text(
           notes.title,
          style: const TextStyle(color: Colors.black ,
          fontSize: 26),
         ),

        subtitle: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16, right: 3),
          child: Text(
       notes.subTitle,
        style: const TextStyle(color: Colors.black38 ,
        fontSize: 17 ),
          ),
        ),
        trailing: Transform.translate(
          offset: Offset(0, -20), // السالب يعني لفوق
       child:  IconButton(
         onPressed: () {
           notes.delete();
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
          notes.date,
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
