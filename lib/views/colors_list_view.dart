

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart' show kColors;
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';

class ColorItem extends StatelessWidget {
   ColorItem({super.key, required this.isActive, required this.color});
 final bool isActive;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
      ),
    )

    :  CircleAvatar(
      radius: 28,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

int currentIndex =0;
 
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox
    (
      height: 28*2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal ,
        itemBuilder: (context, index) {
          return Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 2.0),
            child:  GestureDetector( onTap: () {
              currentIndex = index;

              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              setState(() {
                
              });
            },
              child: ColorItem ( 
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}