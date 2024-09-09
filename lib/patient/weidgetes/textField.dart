import 'package:flutter/material.dart';

class textFeild extends StatelessWidget {
   textFeild({this.hintText}) ;
String? hintText;
//final List<Icon>iconsImage=[
  //Icon(Icons.email),
  //Icon(Icons.password),

//];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: TextField(
        decoration: InputDecoration(


          filled:true,
          fillColor: Color(0xFFD9D9D9
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Lemon',
            color: Color(0xFFE57A7A

            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.pinkAccent
              )
          ),


        ),
      ),
    );
  }
}
