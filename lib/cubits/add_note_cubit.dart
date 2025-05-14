

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
    }
 }

  //حرف التي ده بيعبر عن تايب وهو مش محدد يعني تعمل الميسود من غير ماتحدد نوعه وبعدين تيجي تقوله بعدين هتبقى من نوع استرنع او اي حاجه ف هو بيقبلها ع طول ويبدل كل تي بالنوع اللي حددته
  // T add<T> (T name)
  // {
  //   return name;
  // }





// void addNote() async {
//   try {
//     emit(AddNoteLoading());
//     // simulate adding note
//     await Future.delayed(Duration(seconds: 1));
//     emit(AddNoteSuccess());
//   } catch (e) {
//     emit(AddNoteFailure(e.toString()));
//   }
// }