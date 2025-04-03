import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/views/add_note_form.dart';
//import 'package:notes_app/constants.dart';
//import 'package:notes_app/views/custom_text_field.dart';
//import 'package:notes_app/views/widgets/custom_button.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),

      child: BlocListener<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },

        child: AbsorbPointer(
          // مش هيتعامل مع الشاشة في حالة loading
          absorbing: State is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const SingleChildScrollView(child: AddNoteForm()),
          ),
        ),
      ),
    );
  }
}
