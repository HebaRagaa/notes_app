

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/color_list_view.dart';
import 'package:notesapp/widgets/custom_button.dart';
import 'package:notesapp/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 32,),
            CustomTextField(
              onSaved: (value) {
                title = value;
              },
              hint: 'title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                subTitle = value;
                //يعني الفاليو اللي هتجيلك خزنها ف الساب تايتل
              },
              hint: 'content',
              maxLines: 5,
            ),

          const  ColorsListView(),

            const SizedBox(
              height: 32,
            ),

            BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddNoteLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //وهنا بعمل تريجر للااد نوت كيوبت من خلال البلوك بروفيدر

                        var currentDate = DateTime.now();

                        var formattedCurrentDate =
                        DateFormat.yMd().format(currentDate);

                        var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: formattedCurrentDate,
                          // ف النوت موديل خزنت الديت ك استرينج عشان تبقى بريميتيف تايب بدل ما اعمل تايب ادابتر لكل اوبجيكت
                          color: Colors.blue.toARGB32(),
                          // toARGB32() بتستعمل بدل دوت فاليو وبرضو بنجيب بيها الفاليو
                        );
                        BlocProvider.of<AddNoteCubit>(context).addNote(
                            noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {

                        });
                      }
                    },
                  );
                }
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )
    );
  }
}


