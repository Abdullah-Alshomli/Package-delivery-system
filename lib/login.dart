import 'package:flutter/material.dart';
import 'databaseUtility.dart';
import 'testt.dart';

String s = "blablabla";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFF272727),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(s),
            TextField(),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text("Submet"))
          ],
        ),
      )),
    );
  }
}
