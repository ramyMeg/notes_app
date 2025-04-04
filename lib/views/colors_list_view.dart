

import 'package:flutter/material.dart';

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
 
  List<Color> colors = const[
    Color(0xff5aa9e6),
    Color(0xff7fc8f8),
    Color(0xfff9f9f9),
    Color(0xffffe45e),
    Color(0xff00CC99),
    Color(0xffDD1155),
    Color(0xffff6392),
    Color(0xff880044),

  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox
    (
      height: 28*2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal ,
        itemBuilder: (context, index) {
          return Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 2.0),
            child:  GestureDetector( onTap: () {
              currentIndex = index;
              setState(() {
                
              });
            },
              child: ColorItem ( 
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}