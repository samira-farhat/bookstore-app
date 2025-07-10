import 'package:flutter/material.dart';
import 'authentication/login.dart';
import 'authentication/register.dart';
import 'authentication/forgotPassword.dart';
import 'coreApp/BottomNav.dart';
import 'coreApp/searchPage.dart';
import 'coreApp/cartPage.dart';
import 'coreApp/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main () {
  runApp(
    MaterialApp(
      // named routes to navigate between pages
      initialRoute: '/',
      routes: {
        '/' : (context) => BookstoreApp(),
        '/login' : (context) => LoginPage(),
        '/register' : (context) => RegisterPage(),
        '/forgot_password' : (context) => ForgotPasswordPage(),
        '/nav' : (context) => NavPage(),
        '/search' : (context) => SearchPage(),
        '/cart' : (context) => CartPage(),
        '/profile' : (context) => ProfilePage(),
      },
    ),
  );
}

// this will be the main screen of the app which displays the login page inside a scaffold
class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});

  // a function to check if the user is already logged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString('authentication_token') != null; // if the token isn't null then it exists in local storage then the user is logged in
  }

  @override
  Widget build(BuildContext context) {
    // used future builder to wait for the isLoggedIn check to finish
    return FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          // while waiting for the result show a loading spinner
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          // if the user is logged in, go directly to the main screen of the app/ home
          else if (snapshot.hasData && snapshot.data == true){
            return NavPage(); // already logged in
          }
          // else if the user isn't logged in, show the login screen
          else{
            return Scaffold(
              backgroundColor: Colors.purple[100],
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent[100],
                title: Text('Bookstore App',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: LoginPage(),
            );
          }
        }
    );
  }
}

