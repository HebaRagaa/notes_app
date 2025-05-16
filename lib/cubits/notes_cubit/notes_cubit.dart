
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());


  List<NoteModel>? notes ;
  fetchAllNotes() async {
   // emit(NotesLoading());
    //ومش محتاج الاويت ولا اللودينج عشان البيانات بتجياك ع طول مره واحده
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //ولازم الهايف تبقى نفس اللي ف المين
       notes = notesBox.values.toList();
      //List<NoteModel>? notes= notesBox.values.toList();
      //لو وقفت عالفاليو هتلاقيها بتاخد اتريبل ومعناها كوليكشن اوف حاجه زي هنا النوت موديل اللي هى بين اكبر واصغر من
      emit(NotesSuccess(notes!));
    }
  }
 //انا لما ضيفت الادد نوتس كيوبت ف البوتوم شيت كنت لما افتح الشيت يعمل كرييت للكيوبت واجي اقفله ف يقفل الكيوبت وبكده وفرت ريسورسز
 //لكن ف النوتس كيوبت بتاع النوتس فيو ده انا عايزاه موجود عشان الفيو بتاع النوتس موجود ورا الشيت او الاساسي وف الايديت
 //عشان كده مش هتفرق اوي حطيته ف المين ولا فوق الفيو ف النوتس فيو مش هيفرق لان مع الكيوبت ده مش هستهلك الريسورسز ع الفاضي




