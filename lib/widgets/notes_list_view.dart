  
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {

          List<NoteModel> notes =
               BlocProvider.of<NotesCubit>(context).notes!;

          return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                itemCount: notes.length,
                 // itemCount: state is NotesSuccess ? state.notes.length : 0 ,
                  //ولغيت دي عشان لغيت الاستيت اللي مالوش داعي ف الكيوبت عشان كده كده هيبقى سكسيس
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: NoteItem(
                        notes: notes[index],
                      ),
                    );
                  }
              )
          );
        }
    );
  }
 }