import 'package:flutter/material.dart';

class RecContanier extends StatelessWidget {
  RecContanier({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          bottom:
              BorderSide(width: 1, color: Color.fromARGB(255, 215, 212, 212)),
        )),
        // color: Color.fromARGB(255, 215, 212, 212)
        height: 50,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
