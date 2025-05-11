

 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({super.key});

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
         color: Color(0xffFFCC80),
         borderRadius: BorderRadius.circular(16),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         //عشان اخلي التاريخ ف جنب الكونتينر ف الاخر
         children: [
      ListTile(
        title: const Text('Flutter Tips',
          style: TextStyle(color: Colors.black ,
          fontSize: 26),
         ),

        subtitle: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16, right: 3),
          child: Text('Build your career with Heba bebo',
        style: TextStyle(color: Colors.black38 ,
        fontSize: 17 ),
          ),
        ),
        trailing: Transform.translate(
          offset: Offset(0, -20), // السالب يعني لفوق
       child:  IconButton(onPressed: () {} ,
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
          child: Text('May10 , 2025',
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
