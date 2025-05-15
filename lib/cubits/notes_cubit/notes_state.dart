
 part of 'notes_cubit.dart';

 abstract class NotesState {}

 class NotesInitial extends NotesState {}

 class NotesLoading extends NotesState {}
 //وبايدك تختار انت عايز تخزن الليست هنا ف السكسيس ولا تخليها ف الكيوبت
 class NotesSuccess extends NotesState {
   //لو عندي البيانات وهعرضها كلها ف مكان واحد مش هباصيها من ويدجت للتاني يبقى هخليها ف السكسيس
 //اما ف الحاله التانيه بخليها ف الكيوبت وباكسسها عن طريقه

 final List<NoteModel> notes;

  NotesSuccess(this.notes);
 }

 class NotesFailure extends NotesState {
   final String errorMessage;

   NotesFailure(this.errorMessage);
 }
