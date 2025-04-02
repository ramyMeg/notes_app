import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const EditNoteView();
        }),);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 16, right: 0, left: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 207, 144),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // خاصة بالتاريخ
          children: [
            ListTile(
              title: const Text(
                'Flutter Tips',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 40),
                child: Text(
                  'build your career with Flutter Android & Ios App.',
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.trash, color: Colors.black, size: 24),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'March30 , 2025',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
