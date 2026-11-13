import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();}
  class _LoginPageState extends State<LoginPage> {
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordvisible = false;
  final _formKey = GlobalKey<FormState>();
 
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    // Add more email validation logic if needed
    return null;
  }
String? _PasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Add more password validation logic if needed
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "Login Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo.jpg',
                height: 80,
                width: 80,
              ),
              Text(
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),prefixIcon: Icon(Icons.email)
            ),
              validator: _validateEmail,
                ),
             SizedBox(height: 30),
              TextFormField(
                obscureText: !_passwordvisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),prefixIcon: Icon(Icons.password),suffixIcon: IconButton(onPressed:(){},icon:Icon(_passwordvisible ? Icons.visibility : Icons.visibility_off))),
                 
                  validator:_PasswordValidator,
             
                ), 
                SizedBox(height: 20),
                ElevatedButton(onPressed:  () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login successful'))
                    );
                    Navigator.pushReplacementNamed(context, '/home');
                    // Perform login logic here
                   
                  }
                }  ,  style:ElevatedButton.styleFrom
                ( padding : EdgeInsets.symmetric(vertical: 20.0) ,backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )),
                child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),)),
                SizedBox(height: 20),
                TextButton(onPressed:  () {
                  Navigator.pushNamed(context, '/register');
                }, child: Text("Don't have an account? Sign up", 
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                 fontStyle: FontStyle.italic ),)
               )
            ]
          
            
        ),
      )
    ) );
  }
}