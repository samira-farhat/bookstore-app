import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => ForgotPasswordState();

}

class ForgotPasswordState extends State<ForgotPasswordPage> {

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading= false;

  Future<bool> resetPassword(String email) async {
    await Future.delayed(Duration(seconds: 2));

    return email.contains('@');
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
        // added a container with decoration for UI styling
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
          
          child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // to wrap the content in the container vertically
                children: <Widget> [
                  Text('Forgot Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30),

                  Text('Enter your email address',
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
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 40),

                  // reset button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () async {
                        if(formKey.currentState!.validate()){

                          setState(() {
                            isLoading= true;
                          });

                          bool success= await resetPassword(emailController.text);

                          setState(() {
                            isLoading= false;
                          });

                          if(success){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('reset link sent!')),
                            );
                            Navigator.pop(context); // return to login
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to send reset link')),
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
                      CircularProgressIndicator()
                      :
                      Text('Reset Password',
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
    );
  }
}

