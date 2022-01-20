import 'package:flutter/material.dart';
import '../constants_and_methods.dart';

class SearchInput extends StatelessWidget {
  final Function function;
  final String placeholder;

  SearchInput({
    required this.function,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search-input',
      child: Material(
        color: Colors.transparent,
        child: TextField(
          onChanged: (value) => function(value.trim()),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff000000).withOpacity(0.3),
              size: 28.0,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: placeholder,
            hintStyle: kAuthInputHintStyle.copyWith(
              fontSize: 16.0,
            ),
            contentPadding: kAuthInputPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
