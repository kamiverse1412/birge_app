import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/auth_modal.dart';
import 'auth_page_route.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  final String? serviceName;

  const LoginPage({Key? key, this.serviceName}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  static const String validEmail = 'mukashkamila@gmail.com';
  static const String validPassword = '12345678';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_emailController.text == validEmail &&
        _passwordController.text == validPassword) {
      Navigator.pop(context, {
        'success': true,
        'serviceName': widget.serviceName,
        'email': _emailController.text,
        'name': 'Mukash Kamila',
      });
    } else if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Барлық өрістерді толтырыңыз')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Қате email немесе құпиясөз')),
      );
    }
  }

  void _handleGoogleSignIn() {
    Navigator.pop(context, {
      'success': true,
      'serviceName': widget.serviceName,
      'email': 'mukashkamila@gmail.com',
      'name': 'Mukash Kamila',
    });
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Құпиясөзді қалпына келтіру')));
  }

  void _handleToggleMode() {
    Navigator.of(context).pushReplacement(
      AuthPageRoute(child: const RegisterPage(), withAnimation: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.black.withOpacity(0.15)),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: AuthModal(
                  isLogin: true,
                  onToggleMode: _handleToggleMode,
                  onClose: () => Navigator.of(context).pop(),
                  emailController: _emailController,
                  passwordController: _passwordController,
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  },
                  onPrimaryAction: _handleLogin,
                  onGoogleSignIn: _handleGoogleSignIn,
                  onForgotPassword: _handleForgotPassword,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
