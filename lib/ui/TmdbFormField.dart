import 'package:flutter/material.dart';

class TmdbFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Function validator;
  final bool isPassword;
  final bool isEmail;

  TmdbFormField({
    this.controller,
    this.focusNode,
    this.hintText,
    this.validator,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      // decoration: InputDecoration(
      //     focusColor: Colors.white,
      //     hoverColor: Colors.white,
      //     hintText: hintText,
      //     contentPadding: const EdgeInsets.all(20.0),
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Colors.white30,
      //       ),
      //       borderRadius: BorderRadius.circular(5.0),
      //     ),
      //     disabledBorder: InputBorder.none,
      //     errorBorder: InputBorder.none,
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Colors.white60,
      //       ),
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      //     focusedErrorBorder: InputBorder.none,
      //     filled: true,
      //     // fillColor: Colors.white24,
      //     fillColor: Color(0xff3d3e40),
      //     suffixIcon:
      //         isPassword ? Icon(Icons.remove_red_eye_sharp) : Container()),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
        hintText: hintText,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: isPassword ? true : false,
      validator: validator,
      onSaved: (String value) => value.trim(),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      cursorColor: Colors.white,
      // onEditingComplete: focusNode.nextFocus,
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    );
  }
}
