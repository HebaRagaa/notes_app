

import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote() async {
    try {
      emit(AddNoteLoading());
      // simulate adding note
      await Future.delayed(Duration(seconds: 1));
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
