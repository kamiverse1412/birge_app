import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/auth_modal.dart';
import 'auth_page_route.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // Handle login logic here
    print('Login with email: ${_emailController.text}');
  }

  void _handleGoogleSignIn() {
    // Handle Google sign in logic here
    print('Google sign in');
  }

  void _handleForgotPassword() {
    // Handle forgot password logic here
    print('Forgot password');
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
          // Blurred background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.black.withOpacity(0.15)),
            ),
          ),

          // Modal content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                AuthModal(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
