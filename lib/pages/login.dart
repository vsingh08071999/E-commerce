import 'package:ecommerceapp1/pages/home.dart';
import 'package:ecommerceapp1/pages/signup.dart';
import 'package:ecommerceapp1/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidepass = true;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  bool loading = false;
  bool isLoggedIn = false;
  isSignIn() async {
    print("signIn");
    setState(() {
      loading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    print('handle 1');
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    FirebaseUser firebaseUser = authResult.user;
    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // insert user to our collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "picture": firebaseUser.photoUrl
        });
        await sharedPreferences.setString("id", firebaseUser.uid);
        await sharedPreferences.setString("username", firebaseUser.displayName);
        await sharedPreferences.setString("picture", firebaseUser.photoUrl);
      } else {
        await sharedPreferences.setString("id", documents[0]['id']);
        await sharedPreferences.setString("username", documents[0]['username']);
        await sharedPreferences.setString("picture", documents[0]['photoUrl']);
      }
      //Fluttertoast.showToast(msg: "Login was successfull");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else
      //Fluttertoast.showToast(msg: " Login Failed");
      print("LoginFailed");
  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    print("signIn1");
//    isSignIn();
//  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350],
                            blurRadius:
                                20.0, // has the effect of softening the shadow
                          )
                        ],
                      ),
                      child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'images/logo.png',
                                      width: 260.0,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        icon: Icon(Icons.alternate_email),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      controller: _password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The password field can't be empty";
                                        } else if (value.length < 6) {
                                          return "the password has to be at least 6 characters long";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.black,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          if (!await user.signIn(
                                              _email.text, _password.text))
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Sign in failed")));
                                        }
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Forgot password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUP()));
                                          },
                                          child: Text(
                                            "Create an account",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "or sign in with",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            "images/ggg.png",
                                            width: 30,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
    );
//    return SafeArea(
//      child: Scaffold(
////        bottomNavigationBar: Container(
////          padding: EdgeInsets.symmetric(horizontal: 10),
////          child: FlatButton(
////            child: Text(
////              "Sign in/Sign up with google",
////              style: TextStyle(color: Colors.white, fontSize: 22),
////            ),
////            color: Colors.red,
////            onPressed: handleSignIn,
////          ),
////        ),
//        body: Stack(
//          children: <Widget>[
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
//              padding: EdgeInsets.only(left: 100),
//              alignment: Alignment.center,
//              height: 240,
//              child: Image.network(
//                  'https://www.citysearch.pk/uf/companies/5431/fashion-central-logo.png'),
//              width: 280,
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 220),
//              child: Form(
//                key: _keyForm,
//                child: ListView(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        color: Colors.white.withOpacity(0.7),
//                        borderRadius: BorderRadius.all(Radius.circular(13)),
//                        child: Padding(
//                          padding: EdgeInsets.only(left: 12),
//                          child: TextFormField(
//                            controller: _emailController,
//                            validator: (value) {},
//                            decoration: InputDecoration(
//                                hintText: "Email",
//                                icon: Icon(Icons.alternate_email)),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        color: Colors.white.withOpacity(0.8),
//                        borderRadius: BorderRadius.all(Radius.circular(13)),
//                        child: Padding(
//                          padding: EdgeInsets.only(left: 12),
//                          child: ListTile(
//                            trailing: IconButton(
//                              icon: Icon(
//                                Icons.remove_red_eye,
//                              ),
//                              onPressed: () {
//                                setState(() {
//                                  hidepass = false;
//                                });
//                              },
//                            ),
//                            title: TextFormField(
//                              controller: _passwordController,
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return "The Password field cannot be empty";
//                                } else if (value.length < 6) {
//                                  return "the password has to be atleast 6 character long";
//                                } else
//                                  return null;
//                              },
//                              obscureText: hidepass,
//                              decoration: InputDecoration(
//                                  border: InputBorder.none,
//                                  hintText: "Password",
//                                  icon: Icon(Icons.lock_outline)),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.all(8),
//                      child: Material(
//                        color: Colors.blue,
//                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        child: MaterialButton(
//                          minWidth: MediaQuery.of(context).size.width,
//                          onPressed: () {
//                            handleSignIn();
//                          },
//                          child: Text(
//                            "Login",
//                            style: TextStyle(fontSize: 20, color: Colors.white),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.center,
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text(
//                          "Forget password",
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 15,
//                              fontWeight: FontWeight.w400),
//                        ),
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.center,
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: InkWell(
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => SignUP()));
//                          },
//                          child: Text(
//                            "Sign up",
//                            style: TextStyle(
//                                color: Colors.red,
//                                fontSize: 20,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Visibility(
//                      visible: loading ?? true,
//                      child: Container(
//                        alignment: Alignment.center,
//                        color: Colors.white.withOpacity(0.9),
//                        child: CircularProgressIndicator(
//                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                        ),
//                      ),
//                    )
////                    Align(
////                      alignment: Alignment.centerLeft,
////                      child: Padding(
////                        padding: EdgeInsets.all(8),
////                        child: RichText(
////                          text: TextSpan(children: [
////                            TextSpan(
////                                text: "Don't have an account? click here to",
////                                style: TextStyle(
////                                    fontWeight: FontWeight.w500, fontSize: 18)),
////                            TextSpan(
////                                text: " sign up!",
////                                style: TextStyle(
////                                    color: Colors.red,
////                                    fontWeight: FontWeight.w500,
////                                    fontSize: 18)),
////                          ]),
////                        ),
////                      ),
////                    ),
////                    Divider(
////                      color: Colors.white,
////                    ),
////                    Text(
////                      "Other login option",
////                      style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 20,
////                          fontWeight: FontWeight.bold),
////                    ),
//
////                    Padding(
////                      padding: EdgeInsets.all(8),
////                      child: Material(
////                        color: Colors.red,
////                        borderRadius: BorderRadius.all(Radius.circular(20)),
////                        child: MaterialButton(
////                          minWidth: MediaQuery.of(context).size.width,
////                          onPressed: () {},
////                          child: Text(
////                            "Google",
////                            style: TextStyle(fontSize: 20, color: Colors.white),
////                          ),
////                        ),
////                      ),
////                    )
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
  }
}
