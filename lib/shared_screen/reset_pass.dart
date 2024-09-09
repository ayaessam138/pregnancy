import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  TextEditingController myemail = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: myemail.text);
      myemail.clear();
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE57A7A),
        title: Text("Reset Password"),
      ),

      //   body: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 25.5),
      //         child: Text('Enter your Email and we will send you a passwprd reset link',
      //         textAlign: TextAlign.center,),
      //       ),
      //       SizedBox(height: 10,),
      //
      //       TextFormField(
      //         onSaved: (val) {
      //
      //           resetemail = val;
      //         },
      //         validator: (val) {
      //           if (val!.length > 100) {
      //             return "Email can't to be larger than 100 letter";
      //           }
      //           if (val.length < 2) {
      //             return "Email can't to be less than 2 letter";
      //           }
      //           return null;
      //         },
      //         decoration: InputDecoration(
      //             prefixIcon: Icon(Icons.person),
      //             hintText: "Email",
      //             border: OutlineInputBorder(
      //                 borderSide: BorderSide(width: 1))),
      //       ),
      //       SizedBox(height: 10,),
      //       MaterialButton(onPressed: (){
      //         Future passwordReset()async{
      //           try{
      //             await FirebaseAuth.instance.sendPasswordResetEmail(email: resetemail);
      //           }on FirebaseException catch(e){
      //             print (e);
      //             showDialog(context: context, builder: (context){
      //               return AlertDialog(
      //                 content: Text(e.message.toString()),
      //               );
      //             });
      //           }
      //
      //         }
      // },
      //         child: Text('Reset Password'),
      //         color: Color(0xFFE57A7A),
      //       )
      //     ],
      //   ),
      body: Form(
        key: formstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.5),
              child: Text(
                'Enter your Email and we will send you a passwprd reset link',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: myemail,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFFE57A7A),
                ),
                hintText: " email",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pinkAccent),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
              ),
              validator: (val) {
                if (val!.length > 100) {
                  return "Email can't to be larger than 100 letter";
                }
                if (val.length < 2) {
                  return "Email can't to be less than 2 letter";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                passwordReset();
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
              },
              child: Text('Reset Password'),
              color: Color(0xFFE57A7A),
            )
          ],
        ),
      ),
    );
  }
}
