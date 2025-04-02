import 'package:flutter/material.dart';
import 'package:notes_app/views/custom_text_field.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children:const [SizedBox(height: 50),
          CustomAppBar(title: 'Edit Note', icon: Icons.check,),
          SizedBox(height: 50,),

          CustomTextField(hint: 'Title', maxlines: 2),
          SizedBox(height: 20,),
          CustomTextField(hint: 'Contant', maxlines: 15),
        ],
      ),
    );
  }
}