import 'package:flutter/material.dart';

class SignInViews extends StatefulWidget {
  const SignInViews({super.key});

  @override
  State<SignInViews> createState() => _SignInViewsState();
}

class _SignInViewsState extends State<SignInViews> {
  String _username = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (text) {
                  _username = text.trim().toLowerCase();
                },
                decoration: const InputDecoration(hintText: 'username'),
                validator: (text) {
                  text = text?.trim().toLowerCase();
                  if (text!.isEmpty) {
                    return 'Invalid username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (text) {
                  _password = text.replaceAll(' ', '').toLowerCase();
                },
                decoration: const InputDecoration(hintText: 'password'),
                validator: (text) {
                  text = text?.replaceAll(' ', '').toLowerCase();
                  if (text!.length < 4) {
                    return 'Invalid password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Builder(builder: (context) {
                return MaterialButton(
                  onPressed: () {
                    final isValid = Form.of(context)!.validate();
                    if (isValid) {}
                  },
                  color: Colors.blue,
                  child: const Text("Sign"),
                );
              })
            ],
          ),
        ),
      ),
    ));
  }
}
