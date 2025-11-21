import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/auth_modal.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    // Handle registration logic here
    print('Register with email: ${_emailController.text}');
  }

  void _handleGoogleSignIn() {
    // Handle Google sign in logic here
    print('Google sign in');
  }

  void _handleToggleMode() {
    // Navigate to login page
    Navigator.of(context).pop();
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
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          
          // Modal content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                AuthModal(
                  isLogin: false,
                  onToggleMode: _handleToggleMode,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  },
                  onPrimaryAction: _handleRegister,
                  onGoogleSignIn: _handleGoogleSignIn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

