import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterState();

}

class RegisterState extends State<RegisterPage> {

  TextEditingController nameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmPasswordController =  TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading= false;

  // function to send the registration data to the API
  Future<bool> registerUser(String name, String email, String password) async {
    var url= Uri.parse('https://reqres.in/api/register'); // API endpoint for registration

    var response= await http.post(
        url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: jsonEncode(
        {
          // in the registration part:
          "email": email, // use this email: eve.holt@reqres.in
          "password": password, // use this password: pistol
          // PS: u can put any name it doesn't matter since we arent taking it
        }
      ),
    );

    if(response.statusCode == 200){
      // successful registration
      return true;
    }
    else{
      // failed registration
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.purple,
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
          ),

          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // to wrap the content in the container vertically
                children: <Widget> [
                  Text('Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  SizedBox(height: 30),
            
                  Text('Name',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            
                  SizedBox(height: 10),
            
                  // text field for name input
                  TextFormField(
                    controller: nameController, // so we could get the input
            
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'enter your name',
                      border: OutlineInputBorder(),
                    ),
            
                    // validation for name input
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
            
                  SizedBox(height: 20),
            
                  Text('Email',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            
                  SizedBox(height: 10),
            
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
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                  ),
            
                  SizedBox(height: 20),
            
                  Text('Password',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            
                  SizedBox(height: 10),
            
                  // text field for password input
                  TextFormField(
                    controller: passwordController, // so we could get the input
            
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'enter your password',
                      border: OutlineInputBorder(),
                    ),
            
                    obscureText: true, // to hide the text
            
                    // validation for password input
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
            
                  SizedBox(height: 20),
            
                  Text('Confirm Password',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
            
                  SizedBox(height: 10),
            
                  // text field for confirm password input
                  TextFormField(
                    controller: confirmPasswordController, // so we could get the input
            
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'confirm your password',
                      border: OutlineInputBorder(),
                    ),
            
                    obscureText: true, // to hide the text
            
                    // validation for confirm password input + making sure it matches the password
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please confirm your password';
                      }
                      // checks if passwords match
                      else if (value != passwordController.text){
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
            
                  SizedBox(height: 40),
            
                  // register button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () async {
                        if(formKey.currentState!.validate()){

                          setState(() {
                            isLoading= true;
                          });
            
                          bool success= await registerUser(nameController.text, emailController.text, passwordController.text);

                          setState(() {
                            isLoading= false;
                          });

                          if(success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registration successful!')),
                            );
                            Navigator.pop(context); // go to the login page to log in
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registration failed. Try again.')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[300],
                      ),
                      // show a loading spinner
                      child: isLoading
                          ?
                      CircularProgressIndicator(color: Colors.black)
                          :
                      Text('Register',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
            
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


