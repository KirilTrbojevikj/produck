import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget{
  final TextEditingController textEditingController;
  final bool isPass;
  final String hitText;
  final TextInputType textInputType;
  const TextFieldInput({Key? key, required this.textEditingController,  this.isPass = false, required this.hitText, required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context)
  );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hitText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        ),
      keyboardType: textInputType,
      obscureText: isPass,
      );
  }
}