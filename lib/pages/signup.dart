// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import '../components/tile.dart';
import '../components/auth_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  // Location Dorpdown Initial Items
  String selectedLocation = 'South C';

  // List of locations (will be included in DB)
  var locations = [
    'South C',
    'South B',
    'Nairobi West',
    'Langata',
    'Madaraka',
  ];

// sign in user
  void signUpFunc() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

// try catch block to handle auth
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
// stops the spinning loader
      Navigator.pop(context);
      // handles wrong email
      if (e.code == 'user-not-found') {
        displayAlert('Please check your email and try again');
      }
      // handles wrong password
      else if (e.code == 'wrong-password') {
        displayAlert('You have entered the wrong password');
      } else {
        displayAlert(e.message as String);
      }
    }
  }

  // handle login issues
  void displayAlert(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              const Text(
                'Create a new account',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: nameController,
                hint: 'Name',
                hide: false,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hint: 'Email',
                hide: false,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: phoneController,
                hint: 'Phone Number',
                hide: false,
              ),
              const SizedBox(height: 25),
              DropdownButton(
                value: selectedLocation,
                icon: Icon(Icons.arrow_drop_down),
                items: locations.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                //change the location to the selected item
                onChanged: (String? newval) {
                  setState(() {
                    selectedLocation = newval!;
                  });
                },
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: passwordController,
                hint: 'Password',
                hide: true,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: passwordController,
                hint: 'COnfirm Password',
                hide: true,
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Text('Forgot Password?')],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: signUpFunc,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Tile(imagePath: 'assets/images/google.png'),
                  SizedBox(
                    width: 50,
                  ),
                  Tile(imagePath: 'assets/images/apple.png'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?'),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login here',
                      style: TextStyle(
                          color: Colors.blue[700], fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
