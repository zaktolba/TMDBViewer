import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/ui/TmdbFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validate/validate.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  // LoginPage({@required this.media});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _mailController = TextEditingController();
  var _passwordController = TextEditingController();
  FocusNode _mailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  var _isLoading = false;
  bool _wrongCredentials = false;
  bool _success;
  String _userEmail;

  void _signInWithEmailAndPassword() async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _mailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          _success = true;
          _mailController.text = user.email;
          print("success");
          Navigator.of(context).pushNamed('home');
        });
      } else {
        setState(() {
          _success = false;
          print("fail");
        });
      }
    } on PlatformException catch (err) {
      print("Error status code: ${err.code}");
      setState(() {
        _isLoading = false;
        _wrongCredentials = true;
      });
    }
  }

  String _validateEmail(String value) {
    setState(() {
      _wrongCredentials = false;
    });
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'L\'adresse email n\'est pas valide.';
    }
    return null;
  }

  String _validatePassword(String value) {
    setState(() {
      _wrongCredentials = false;
    });
    if (value.isEmpty) {
      return 'Veuillez renseigner le mot de passe';
    }
    return null;
  }

  void dispose() {
    _mailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Form(
              key: this._formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  Spacer(),
                  Text(
                    'TMDB Viewer',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TmdbFormField(
                    controller: _mailController,
                    hintText: "Email",
                    isPassword: false,
                    focusNode: _mailFocus,
                    validator: this._validateEmail,
                  ),
                  SizedBox(height: 15.0),
                  TmdbFormField(
                    controller: _passwordController,
                    hintText: "Password",
                    isPassword: true,
                    focusNode: _passwordFocus,
                    validator: this._validatePassword,
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          if (this._formKey.currentState.validate()) {
                            _signInWithEmailAndPassword();
                          }
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
                  Text(
                      _wrongCredentials
                          ? 'Mauvais identifiant / mot de passe'
                          : '',
                      style: TextStyle(color: Colors.red)),
                ]),
              )),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
