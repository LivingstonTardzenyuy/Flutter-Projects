import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcq/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Flexible(child: LoginButton(color: Colors.deepPurple, icon: FontAwesomeIcons.userNinja, text: 'Continue as guess', loginMethod: AuthService().anonLogin,))
          ],
        ),
      )
    );
  }
}


class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  LoginButton({
    required this.color,
    required this.icon,
    required this.text,
    required this.loginMethod
});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
          onPressed:() => loginMethod(),
          icon: Icon(
            icon,
            color: Colors.white, size: 20,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: color
          ),
          label: Text(text)),
    );
  }
}
