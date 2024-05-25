// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextFied extends StatefulWidget {
  final String labelText;
  late TextEditingController controll;

  MyTextFied({super.key, required this.controll, required this.labelText});

  @override
  State<MyTextFied> createState() => _MyTextFiedState();
}

class _MyTextFiedState extends State<MyTextFied> {
  String? errorText;

  @override
  void initState() {
    widget.controll.addListener(_validateInput);
    super.initState();
  }

  @override
  void dispose() {
    widget.controll.addListener(_validateInput);
    widget.controll.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      final text = widget.controll.text;
      if (text.isEmpty || double.tryParse(text) == null) {
        errorText = 'Please enter a valid number';
      } else {
        errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: widget.controll,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: errorText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
