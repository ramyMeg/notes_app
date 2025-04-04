import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/colors_list_view.dart';
import 'package:notes_app/views/custom_text_field.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
            maxlines: 3,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(height: 8),
          ColorsListView(),
          const SizedBox(height: 8),

          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading:state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formattedCurrentDate = DateFormat('EEE, d-M-y').format(currentDate);

                    // ignore: deprecated_member_use
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.lightBlue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

