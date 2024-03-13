import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import '../widgets/greetings.dart';
import '../widgets/is_a_member.dart';
import '../widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({super.key, required this.showLoginPage});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  final String page = 'register';

  Future signUp() async {
    if (!passwordConfirmed()) return;

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    addUserDetails(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_ageController.text.trim()),
    );
  }

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    return _passwordController.text.trim() ==
        _confirmPasswordController.text.trim();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Greetings(page: page),
                const SizedBox(height: 50.0),
                TextInput(
                  controller: _firstNameController,
                  hintText: 'First name',
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                ),
                const SizedBox(height: 10.0),
                TextInput(
                  controller: _lastNameController,
                  hintText: 'Last name',
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.familyName],
                ),
                const SizedBox(height: 10.0),
                TextInput(
                  controller: _ageController,
                  hintText: 'Age',
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  autofillHints: const [''],
                ),
                const SizedBox(height: 10.0),
                AutofillGroup(
                    child: Column(
                  children: [
                    TextInput(
                      controller: _emailController,
                      hintText: 'Email',
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                    ),
                    const SizedBox(height: 10.0),
                    TextInput(
                      controller: _passwordController,
                      hintText: 'Password',
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                    ),
                    const SizedBox(height: 10.0),
                    TextInput(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm password',
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                    ),
                  ],
                )),
                const SizedBox(height: 10.0),

                // sign in button
                ActionButton(action: signUp),
                const SizedBox(height: 25.0),
                IsMember(
                  showAnotherPage: widget.showLoginPage,
                  member: 'Already a member?',
                  action: 'Login now!',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
