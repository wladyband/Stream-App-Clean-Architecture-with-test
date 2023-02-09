import 'package:flutter/material.dart';
import 'package:stream/app/data/services/utils/validations.dart';

class SignInViews extends StatefulWidget {
  const SignInViews({super.key});

  @override
  State<SignInViews> createState() => _SignInViewsState();
}

class _SignInViewsState extends State<SignInViews> with Validations {
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
                validator: (value) => combiner([
                  () => isNotEmpty(value, 'Please inform user login'),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (text) {
                  _password = text.replaceAll(' ', '').toLowerCase();
                },
                decoration: const InputDecoration(hintText: 'password'),
                validator: (value) => combiner([
                  () => isNotEmpty(value),
                  () => validatorNumber(value, 4),
                ]),
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
