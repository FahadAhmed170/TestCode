import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  TextEditingController _userNameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final userName = FocusNode();
  final password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        //  color: Colors.blue[900],

                        // borderRadius: BorderRadius.only(bottomRight: )
                        ),
                  ),
                  Positioned(
                    top: 60,
                    right: 0,
                    left: 30,
                    bottom: 0,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                height: 600,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 600,
                      decoration: BoxDecoration(

                          //sssssssss
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80),
                              bottomLeft: Radius.circular(220)),
                          color: Colors.white),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Care App',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: <Widget>[
                                  customField(
                                      context,
                                      'User Name',
                                      () {},
                                      userName,
                                      password,
                                      TextInputType.text, (value) {
                                    if (value.isEmpty) {
                                      return 'Name is Required';
                                    }
                                  }, _userNameController, false),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  customField(
                                      context,
                                      'Password',
                                      () {},
                                      password,
                                      null,
                                      TextInputType.text, (value) {
                                    if (value.isEmpty) {
                                      return 'Password is Required';
                                    }
                                  }, _passwordController, false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    textColor: Colors.white,
                                    buttonColor: Colors.blue,
                                    text: 'Sign In',
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomAuthButton(
                                    buttonColor: Colors.blue,
                                    onPressed: () {},
                                    text: 'SignIn with FaceBook',
                                    textColor: Colors.white,
                                    image: "assets/facebook logo.png",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomAuthButton(
                                    buttonColor: Colors.greenAccent,
                                    onPressed: () {},
                                    text: 'SignIn with Google',
                                    textColor: Colors.white,
                                    image: "assets/googlelogo.png",
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Create Account',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customField(
      BuildContext context,
      String title,
      Function
          onSaved, //45 - 24 - 20,MediaQuery.of(context).size.width - 60, //- 9 - 5,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextInputType keyboardType,
      FormFieldValidator<String> validator,
      TextEditingController controller,
      bool obscure) {
    return TextFormField(
      obscureText: obscure,
      // obscureText: _isVisible ? true : false,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: title,
        // border: InputBorder.none,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
      ),
      textInputAction:
          nextFocusNode == null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).unfocus();
        nextFocusNode == null
            ? FocusScope.of(context).unfocus()
            : FocusScope.of(context).requestFocus(nextFocusNode);
      },
      //   autovalidate: true,
      validator: validator,
      onSaved: (value) {},
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Function onPressed;

  const CustomButton({
    Key key,
    this.text,
    this.textColor,
    this.buttonColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08, //60,
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          color: buttonColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Function onPressed;
  final String image;

  const CustomAuthButton(
      {Key key,
      this.text,
      this.textColor,
      this.buttonColor,
      this.onPressed,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08, //60,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: buttonColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  text,
                  style: TextStyle(color: textColor),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 20,
                child: Image.asset(image),
              )
            ],
          ),
        ),
      ),
    );
  }
}
