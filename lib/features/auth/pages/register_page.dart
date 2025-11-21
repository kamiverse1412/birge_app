import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/auth_modal.dart';
import 'auth_page_route.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
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
    Navigator.of(context).pushReplacement(
      AuthPageRoute(child: const LoginPage(), withAnimation: false),
    );
  }

  Future<void> _handleBirthDateTap() async {
    final now = DateTime.now();
    final initialDate = now.subtract(const Duration(days: 365 * 18));
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: now,
    );
    if (picked != null) {
      final day = picked.day.toString().padLeft(2, '0');
      final month = picked.month.toString().padLeft(2, '0');
      final year = picked.year.toString().substring(2);
      setState(() {
        _birthDateController.text = '$day.$month.$year';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = '+7 ';
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxSheetHeight = constraints.maxHeight * 0.95;
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    initialChildSize: maxSheetHeight / constraints.maxHeight,
                    minChildSize: 0.6,
                    maxChildSize: maxSheetHeight / constraints.maxHeight,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        padding: const EdgeInsets.only(bottom: 8),
                        child: AuthModal(
                          isLogin: false,
                          onToggleMode: _handleToggleMode,
                          onClose: () => Navigator.of(context).pop(),
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                          birthDateController: _birthDateController,
                          phoneController: _phoneController,
                          onBirthDateTap: _handleBirthDateTap,
                          rememberMe: _rememberMe,
                          onRememberMeChanged: (value) {
                            setState(() {
                              _rememberMe = value;
                            });
                          },
                          onPrimaryAction: _handleRegister,
                          onGoogleSignIn: _handleGoogleSignIn,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
