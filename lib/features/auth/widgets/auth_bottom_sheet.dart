import 'package:flutter/material.dart';

import 'auth_modal.dart';

class AuthBottomSheet extends StatefulWidget {
  const AuthBottomSheet({super.key});

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLogin = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = '+7 ';
  }

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

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _handlePrimaryAction() {
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).pop();
    messenger.showSnackBar(
      SnackBar(content: Text(_isLogin ? 'Кіру сәтті' : 'Тіркелу сәтті')),
    );
  }

  void _handleGoogleSignIn() {
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).pop();
    messenger.showSnackBar(
      const SnackBar(content: Text('Google арқылы жалғасу әзірге қолжетімсіз')),
    );
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Құпиясөзді қалпына келтіру әзірге жоқ')),
    );
  }

  Future<void> _selectBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.subtract(const Duration(days: 365 * 18)),
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
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SafeArea(
          top: false,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: AuthModal(
                isLogin: _isLogin,
                onToggleMode: _toggleMode,
                onClose: () => Navigator.of(context).pop(),
                firstNameController: _isLogin ? null : _firstNameController,
                lastNameController: _isLogin ? null : _lastNameController,
                emailController: _emailController,
                passwordController: _passwordController,
                confirmPasswordController: _isLogin
                    ? null
                    : _confirmPasswordController,
                birthDateController: _isLogin ? null : _birthDateController,
                phoneController: _isLogin ? null : _phoneController,
                onBirthDateTap: _isLogin ? null : _selectBirthDate,
                rememberMe: _rememberMe,
                onRememberMeChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
                onPrimaryAction: _handlePrimaryAction,
                onGoogleSignIn: _handleGoogleSignIn,
                onForgotPassword: _isLogin ? _handleForgotPassword : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
