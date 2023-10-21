import 'package:diabeto/services/supabase/supabaseAuth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:diabeto/injectable.dart';
import 'package:diabeto/repositories/auth/authRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Center(
              child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  Icons.language,
                  size: 160,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                Container(
                  height: 70,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: UnderlineInputBorder(),
                      filled: true,
                    ),
                    controller: emailFieldController,
                    validator: (value) {
                      if (value == null || !EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        border: UnderlineInputBorder(),
                        filled: true),
                    controller: passwordFieldController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      else if(value.length < 6) {
                        return 'Password must be as least 6 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: 40,
                ),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: FilledButton(
                      child: Text('Log in'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _onClickSignIn(context);
                        }
                      }),
                ),
                Container(
                  height: 15,
                ),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary),
                          textStyle: MaterialStateProperty.all(
                            TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          )),
                      child: Text('Register')),
                ),
                Container(
                  height: 15,
                ),
                TextButton(onPressed: () {}, child: Text('Forgot Password'))
              ],
            ),
          )),
        ),
      ),
    );
  }

  Future<void> _onClickSignIn(BuildContext context) async {
    try {
      await SupabaseAuthRepository.signInEmailAndPassword(email, password)
          .then((response) {
        if (response.user?.id != null) {
          if (response.user?.role == 'seller') {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/seller/home');
          } else if (response.user?.role == 'customer') {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/customer/home');
          }
        }
      });
    } on AuthException catch (e) {
      // TODO: Show proper error to users

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                e.message,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
              duration: Duration(seconds: 2),
            ));
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Unexpected error!',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: Duration(seconds: 2),
      ));
    }
    finally{
      passwordFieldController.clear();
    }
  }
}
