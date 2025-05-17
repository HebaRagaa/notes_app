

import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
 //ولما تختار color من ColorListView:
  // تكلم الكيوبت وتخليه يعدل قيمة selectedColor
  // ولما تيجي تعمل save أو edit تستخدم القيمة اللي جوه الكيوبت.
  Color selectedColor = const Color(0xffFFC482);
  //وطبعا دي حلاوة الكيوبت لما احتار ازاي ااكسز حاجه مش ف نفس الويدجت ترى احطها كمتغير ف الكيوبت وابعتها من خلاله
  //وهنا بدل ما اغعمله نل حطيت ديفولت فاليو كالر معين لو ما اختاروش كالر يظهر هو
  addNote(NoteModel note) async {
   // note.color = selectedColor.toArgb();
    //note.color = selectedColor.value;
    note.color = selectedColor.toARGB32();

    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //ولازم الهايف تبقى نفس اللي ف المين
      await notesBox.add(note);
      emit(AddNoteSuccess());
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