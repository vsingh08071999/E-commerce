import 'file:///C:/Users/Vishal%20Singh/AndroidStudioProjects/ecommerce_app/lib/homepage.dart';
import 'package:ecommerceapp1/db/auth.dart';
import 'package:ecommerceapp1/db/user.dart';
import 'package:ecommerceapp1/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  Auth auth = Auth();
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _confirmPasswordController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserServices _userServices = UserServices();
  String gender;
  String groupValue = "male";
  bool hidepass = true;
  bool hidepass2 = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: user.status == Status.Authenticating
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
//            Image.network(
//              'https://imgix.thezoereport.com/zoe-report/2017/10/milan-fashion-week-street-style-spring-2018-tan-coat-brown-turtle-neck-white-pants-white-shoes.jpg',
//              width: double.infinity,
//              height: double.infinity,
//              fit: BoxFit.fill,
//            ),
//            Container(
//              width: double.infinity,
//              height: double.infinity,
//              color: Colors.black.withOpacity(0.6),
//            ),
//            Container(
//              // padding: EdgeInsets.only(left: 100),
//              alignment: Alignment.center,
//              //height: 240,
//              child: Image.network(
//                  'https://www.citysearch.pk/uf/companies/5431/fashion-central-logo.png'),
//              width: 280,
//            ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 80, left: 20, right: 20, bottom: 80),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 20, color: Colors.grey[350])
                                  ]),
                              child: Form(
                                key: _keyForm,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      // padding: EdgeInsets.only(left: 100),
                                      alignment: Alignment.center,
                                      //height: 240,
                                      child: Image.asset('images/logo.png'),
                                      width: 220,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Material(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: ListTile(
                                            title: TextFormField(
                                              controller: _nameController,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "The name field cannot be empty";
                                                } else
                                                  return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Full Name",
                                                  icon: Icon(
                                                      Icons.person_outline)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.all(Radius.circular(15)),
//                        color: Colors.grey.withOpacity(0.2),
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  'Male',
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(
//                                      // color: Colors.white,
//                                      fontSize: 17,
//                                      fontWeight: FontWeight.w400),
//                                ),
//                                trailing: Radio(
//                                  value: "male",
//                                  groupValue: groupValue,
//                                  onChanged: (value) => changedValue(value),
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  'Female',
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(
//                                      //  color: Colors.white,
//                                      fontSize: 17,
//                                      fontWeight: FontWeight.w400),
//                                ),
//                                trailing: Radio(
//                                  value: "female",
//                                  groupValue: groupValue,
//                                  onChanged: (value) => changedValue(value),
//                                ),
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Material(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: ListTile(
                                            title: TextFormField(
                                              controller: _emailController,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "The email field cannot be empty";
                                                } else if (value.length < 6) {
                                                  return "the email has to be atleast 6 character long";
                                                } else
                                                  return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Email",
                                                  icon: Icon(
                                                      Icons.alternate_email)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Material(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)),
                                        child: ListTile(
                                          trailing: IconButton(
                                            icon: Icon(Icons.remove_red_eye),
                                            onPressed: () {
                                              setState(() {
                                                hidepass = false;
                                              });
                                            },
                                          ),
                                          title: ListTile(
                                            title: TextFormField(
                                              controller: _passwordController,
                                              obscureText: hidepass,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "The Password field cannot be empty";
                                                } else if (value.length < 6) {
                                                  return "the password has to be atleast 6 character long";
                                                } else
                                                  return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  icon:
                                                      Icon(Icons.lock_outline)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Material(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: MaterialButton(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          onPressed: () async {
                                            print('registerButton');
                                            if (_keyForm.currentState
                                                .validate()) {
                                              if (!await user.signUp(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _passwordController.text)) {
                                                _key.currentState
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                      Text('Sign Up failed'),
                                                ));
                                                return;
                                              }
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            }
                                            //  validateForm();
//                            Navigator.pushReplacement(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Home()));
                                          },
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "I already have an account",
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
//                        Padding(
//                          padding: const EdgeInsets.all(16.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
////                              Padding(
////                                padding: const EdgeInsets.all(8.0),
////                                child: Divider(),
////                              ),
////                              Padding(
////                                padding: const EdgeInsets.all(8.0),
////                                child: Text(
////                                  "Or Sing up with",
////                                  style: TextStyle(
////                                      fontSize: 20, color: Colors.grey),
////                                ),
////                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Divider(
//                                  color: Colors.black,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16, left: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Or sign up with",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MaterialButton(
                                                onPressed: () async {
                                                  FirebaseUser user =
                                                      await auth.googleSignIn();
                                                  if (user == null) {
                                                    _userServices.createUser({
                                                      "name": user.displayName,
                                                      "photo": user.photoUrl,
                                                      "id": user.email,
                                                      "userId": user.uid
                                                    });
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Home()));
                                                  }
                                                },
                                                child: Image.asset(
                                                  "images/ggg.png",
                                                  width: 30,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),

//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.fromLTRB(
//                                  14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                  child: MaterialButton(
//                                      onPressed: () {},
//                                      child: Image.asset(
//                                        "images/fb.png",
//                                        width: 60,
//                                      ))),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.fromLTRB(
//                                  14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                  child: MaterialButton(
//                                      onPressed: () async {
//                                        FirebaseUser user =
//                                            await auth.googleSignIn();
//                                        if (user == null) {
//                                          _userServices.createUser({
//                                            "name": user.displayName,
//                                            "photo": user.photoUrl,
//                                            "id": user.email,
//                                            "userId": user.uid
//                                          });
//                                          Navigator.pushReplacement(
//                                              context,
//                                              MaterialPageRoute(
//                                                  builder: (context) =>
//                                                      Home()));
//                                        }
//                                      },
//                                      child: Image.asset(
//                                        "images/ggg.png",
//                                        width: 60,
//                                      ))),
//                            ),
//                          ],
//                        )
//                    Align(
//                      alignment: Alignment.centerLeft,
//                      child: Padding(
//                        padding: EdgeInsets.all(8),
//                        child: RichText(
//                          text: TextSpan(children: [
//                            TextSpan(
//                                text: "Don't have an account? click here to",
//                                style: TextStyle(
//                                    fontWeight: FontWeight.w500, fontSize: 18)),
//                            TextSpan(
//                                text: "Login",
//                                style: TextStyle(
//                                    color: Colors.red,
//                                    fontWeight: FontWeight.w500,
//                                    fontSize: 18)),
//                          ]),
//                        ),
//                      ),
//                    ),
//                    Divider(
//                      color: Colors.white,
//                    ),
//                    Text(
//                      "Other login option",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 20,
//                          fontWeight: FontWeight.bold),
//                    ),

//                    Padding(
//                      padding: EdgeInsets.all(8),
//                      child: Material(
//                        color: Colors.red,
//                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        child: MaterialButton(
//                          minWidth: MediaQuery.of(context).size.width,
//                          onPressed: () {},
//                          child: Text(
//                            "Google",
//                            style: TextStyle(fontSize: 20, color: Colors.white),
//                          ),
//                        ),
//                      ),
//                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: loading ?? true,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.white.withOpacity(0.9),
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
    );
  }

  changedValue(value) {
    setState(() {
      if (value == "male") {
        groupValue = value;
        gender = value;
      } else if (value == "female") {
        groupValue = value;
        gender = value;
      }
    });
  }

  Future validateForm() async {
    print("validateForm");
    FormState formState = _keyForm.currentState;

    if (formState.validate()) {
      formState.reset();
      print("inside validateForm");
      FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
      if (firebaseUser == null) {
        _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((user) => {
                  _userServices.createUser({
                    "username": _nameController.text,
                    "email": _emailController.text,
                    "userId": user.user.uid,
                    "gender": gender,
                  })
                })
            .catchError((err) => {print(err.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }
}
