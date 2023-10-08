import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Center(
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
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Username'),
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: UnderlineInputBorder(),
                  filled: true,
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: FilledButton(onPressed: () {}, child: Text('Log in')),
            ),
            Container(
              height: 20,
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
              height: 150,
            ),
            TextButton(
                onPressed: () {},
                child: Text('Forgot Password'))
          ],
        )),
      ),
    );
  }
}
