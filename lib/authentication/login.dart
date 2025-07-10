import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginState();

}

class LoginState extends State<LoginPage> {
  
  // Controller variables to capture the user's input
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  // global key to use to validate the form
  GlobalKey<FormState> formKey= GlobalKey<FormState>();

  bool isLoading= false;
  

  Future<void> login() async {
    // to save the user input values from the controllers
    final String email= emailController.text.trim();
    final String password= passwordController.text.trim();

    //print('email: $email / password: $password');

    // the endpoint of the API where the login request will be sent to (fake API)
    final url= Uri.parse('https://reqres.in/api/login');

    setState(() {
      isLoading= true; // show the loading spinner
    });

    try{

      // sending a post request to the API
      final response= await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        }, // this tell the server that we're sending json
        body: json.encode(
          {
            'email' : email, // predefined email is: eve.holt@reqres.in
            'password': password, // predefined password is: cityslicka
          }
        ),
        // to convert the body to json
      );

      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');


      setState(() {
        isLoading= false; // hide the spinner after getting the response
      });

      // check if the server returned 200 OK (success)
      if(response.statusCode == 200){
        // decode the json response
        final data= json.decode(response.body);
        final token= data['token']; // getting the authentication token

        // using shared preferences to save the token in local storage
        SharedPreferences prefs= await SharedPreferences.getInstance();
        await prefs.setString('authentication_token', token); // will be used later

        // navigate to the home page and remove the login from the stack, so the user cant go back to it
        Navigator.pushReplacementNamed(context, '/nav');
      }
      else{
        // the status code isn't 200 OK
        final data= json.decode(response.body); // decode the error response

        // show a popup to display the error message we got
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Login Failed'),
              content: Text(data['error'] ?? 'Unknown error'), // show error or unknown error in case of fallback / null value
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context); // close the popup window
                    },
                    child: Text('OK'),
                ),
              ],
            ),
        );
      }

    } catch (error){
      // to handle unexpected errors (eg: no internet)
      print('Login error: $error');

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text('Something went wrong.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // close the popup window
                },
                child: Text('OK'),
              ),
            ],
          ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      
      body: Padding(
          padding: EdgeInsets.all(10.0),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text('LOGIN',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 100),

                // text field for email input
                TextFormField(
                  controller: emailController, // so we could get the input

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'enter your email address',
                    border: OutlineInputBorder(),
                  ),

                  // validation for email input
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // text field for password input
                TextFormField(
                  controller: passwordController, // so we could get the input

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'enter your password',
                    border: OutlineInputBorder(),
                  ),

                  obscureText: true, // to hide the text

                  // validation for email input
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                // login button
                isLoading
                    ?
                Center(child: CircularProgressIndicator())
                    :
                ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        login();
                        //Navigator.pushNamed(context, '/nav');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[200],
                    ),
                    child: Text('Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                ),

                SizedBox(height: 10),

                // added the designs for the 'forgot password' and 'register' pages and their navigation's
                Row(
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          // Navigate to the forgot password page using named routes:
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                        child: Text('Forgot Password?')
                    ),

                    SizedBox(width: 25),

                    TextButton(
                        onPressed: () {
                          // Navigate to the register page using named routes:
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Don\'t have an account? Register')
                    ),
                  ],
                )

              ],
            ),
        ),
      ),
    );
  }
}

