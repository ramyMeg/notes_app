import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');

          } if (state is AddNoteSuccess){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(child: ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
          child: AddNoteForm()));
        },
      ),
    );
  }
}
