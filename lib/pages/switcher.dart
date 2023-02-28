import 'package:flutter/material.dart';
import 'package:reportio/pages/login.dart';
import 'signup.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool showPage = true;

  void togglePage() {
    setState(() {
      showPage = !showPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showPage) {
      return LoginPage(onTap: togglePage);
    } else {
      return SignupPage(onTap: togglePage);
    }
  }
}
