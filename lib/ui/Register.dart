import 'package:flutter/material.dart';
import 'package:test_flutter/ui/MediaList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/ui/TmdbFormField.dart';
import 'package:test_flutter/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  // LoginPage({@required this.media});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var _mailController = TextEditingController();
  var _passwordController = TextEditingController();
  FocusNode _mailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TmdbFormField(
                    hintText: "Email",
                    isPassword: false,
                    focusNode: _mailFocus,
                  ),
                  SizedBox(height: 15.0),
                  TmdbFormField(
                    hintText: "Password",
                    isPassword: true,
                    focusNode: _passwordFocus,
                  ),
                  SizedBox(height: 15.0),
                  TmdbFormField(
                    hintText: "Password",
                    isPassword: true,
                    focusNode: _passwordFocus,
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          
                        },
                        elevation: 10.0,
                        disabledColor: Color(0xff2f3e55),
                        disabledTextColor: Colors.grey,
                        textColor: Colors.white,
                        hoverColor: Color(0xff1e1ef7),
                        color: Colors.grey[800],
                        padding: const EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, color: Colors.grey[600]),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ]),
              )),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
