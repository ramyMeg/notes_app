import 'package:flutter/material.dart';
//import 'package:notes_app/constants.dart';
import 'package:notes_app/views/custom_text_field.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 40),
            CustomTextField(hint: 'Title', maxlines: 2),
            SizedBox(height: 16),
            CustomTextField(hint: 'Content', maxlines: 5),
            SizedBox(height: 32),
            CustomButton(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
