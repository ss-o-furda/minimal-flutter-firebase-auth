import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import '../widgets/greetings.dart';
import '../widgets/is_a_member.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final String page = 'login';

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ActionButton(action: signIn),
                const SizedBox(height: 25.0),
                IsMember(
                  showAnotherPage: widget.showRegisterPage,
                  member: 'Not a member?',
                  action: 'Register now!',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
