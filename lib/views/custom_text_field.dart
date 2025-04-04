import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.maxlines, this.onSaved, this.onChanged,  
  });

  final String hint;
  final int maxlines;
  final void Function (String?)? onSaved  ;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onChanged: onChanged ,
      onSaved : onSaved,
      validator:(value) {
        if(value?.isEmpty ?? true) {
          return "Field is required";
        }else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.white),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
