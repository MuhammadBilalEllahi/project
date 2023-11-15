import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTextField extends StatelessWidget {
  const myTextField({
    super.key,
    required TextEditingController textEditingController,
    required this.label,
    required this.obscureTextBool,
    required this.focus, required this.validator,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final String label;
  final bool focus;
  final bool obscureTextBool;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
        child: TextFormField(
          controller: _textEditingController,
          autofocus: focus,
          validator: validator,
          style: GoogleFonts.abel(),
          obscureText: obscureTextBool,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            
            //  focusColor: Colors.amber
          ),
        ),
      ),
    );
  }
}
