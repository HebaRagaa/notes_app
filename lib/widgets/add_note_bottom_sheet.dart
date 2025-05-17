
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
    const AddNoteBottomSheet({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocProvider(
      //وهنا برضو هيكريت الكيوبت ولكن ف المكان اللي محتاجه ويقلل استعمال الريسورسس
          create: (context) => AddNoteCubit(),
       //وهنا عشان بستعمله مع الادد بوتم شيت
      child: BlocConsumer <AddNoteCubit , AddNoteState> (

           listener: (context, state) {
            if (state is AddNoteFailure) {
            //  print('faild ${state.errorMessage}');
            }
            if (state is AddNoteSuccess) {

              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);

            }
          },
          builder: (context, state) {
    // ModalProgressHUD( inAsyncCall: state is AddNoteLoading ? true : false ,
            return AbsorbPointer(
            //الابسورب بوينتر دي تمنعك من لانك تعرف تتعامل مع اي حاجه تاني ع الاسكرين اثناء اللودينج
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              //دي عشان احل مشكله الاسكرول لما افتح الكيبورد هى بتبقى موجوده ف الاسكاف فولد وانت بتعملها ترو او فولس بس
           //بقول للميديا كواري عايز معلومات عن الديفايز وعن الكيبورد والفيو انسيتس بوتوم دي بتعبر عن ارتفاع الكيبورد
            ),
            child: const SingleChildScrollView(
         //ماينفعش المودل بروجرس هد تبقى جوه سينجل اسكرول فيو
       child: AddNoteForm(),
            )
            )
            );
          },
      )

      );
    }
  }


