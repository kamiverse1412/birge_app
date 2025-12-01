import 'package:birge_app/features/auth/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/auth_modal.dart';

class RegisterPage extends StatefulWidget {
  final String? serviceName;

  const RegisterPage({Key? key, this.serviceName}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Барлық өрістерді толтырыңыз')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Құпиясөздер сәйкес емес')));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AIHomePage()),
    );
  }

  void _handleGoogleSignIn() {
    Navigator.pop(context, {
      'success': true,
      'serviceName': widget.serviceName,
      'email': 'mukashkamila@gmail.com',
      'name': 'Mukash Kamila',
    });
  }

  void _handleToggleMode() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: AuthModal(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
