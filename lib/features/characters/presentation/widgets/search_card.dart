import 'package:flutter/material.dart';

class TextFieldSearchCard extends StatelessWidget {
  final String hintText;
  const TextFieldSearchCard({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.filter_alt_outlined),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffBDBDBD),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff5B6975),
        ),
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
