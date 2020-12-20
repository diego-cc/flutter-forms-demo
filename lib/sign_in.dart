// Define a custom Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() {
    return SignInState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignInState extends State<SignIn> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
        color: Colors.grey,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              "Sign in",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Username...",
                        labelText: "Enter your username",
                        fillColor: Colors.white,
                        hintStyle:
                            TextStyle(color: Colors.white.withAlpha(240)),
                        labelStyle:
                            TextStyle(color: Colors.white.withAlpha(240)),
                        helperStyle:
                            TextStyle(color: Colors.white.withAlpha(240)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.lightGreenAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password...",
                        labelText: "Enter your password",
                        fillColor: Colors.white,
                        hintStyle:
                            TextStyle(color: Colors.white70.withAlpha(240)),
                        labelStyle:
                            TextStyle(color: Colors.white70.withAlpha(240)),
                        helperStyle:
                            TextStyle(color: Colors.white70.withAlpha(240)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.lightGreenAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Processing data..."),
                          ));
                        }
                      },
                      child: Text("Sign In"))
                ]))
          ],
        ));
  }
}
