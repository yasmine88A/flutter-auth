import 'package:flutter/material.dart';
class Registerpage extends StatefulWidget {
  Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordvisible = false;

  final _formKey=GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailpattern = r'^[^@]+@[^@]+\.[^@]+';
    final regExp = RegExp(emailpattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    // Add more email validation logic if needed
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Add more password validation logic if needed
    if(value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Register Page",
          style: TextStyle(
            color: Colors.white,
          
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/logo.jpg',
              width: 80,
              height: 80,
            ),
            Text(
              textAlign: TextAlign.center,
              "Register",
              style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 30),
            ),
            SizedBox(height: 30,
          
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.email),
              ),
              validator: _validateEmail,
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: !_passwordvisible,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed:() {
                      setState(() {
                        _passwordvisible = !_passwordvisible;
                      });
                    },
                    icon: Icon(_passwordvisible 
                    ? Icons.visibility 
                    : Icons.visibility_off),
                    )),
              validator: _passwordValidator,
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: !_passwordvisible,
              controller: _confirmpasswordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed:() {
                      setState(() {
                        _passwordvisible = !_passwordvisible;
                      });
                    },
                    icon: Icon(_passwordvisible 
                    ? Icons.visibility 
                    : Icons.visibility_off),
                    )),
              validator: _passwordValidator,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Registration')));
                  Navigator.pushNamed(context, '/login');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,),
            )),
            
          ]),
      )));
  }
}