import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:birge_app/features/auth/pages/home_page.dart';

class AuthModal extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggleMode;
  final VoidCallback? onClose;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final bool rememberMe;
  final ValueChanged<bool>? onRememberMeChanged;
  final VoidCallback onPrimaryAction;
  final VoidCallback onGoogleSignIn;
  final VoidCallback? onForgotPassword;

  const AuthModal({
    super.key,
    required this.isLogin,
    required this.onToggleMode,
    this.onClose,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    this.rememberMe = false,
    this.onRememberMeChanged,
    required this.onPrimaryAction,
    required this.onGoogleSignIn,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.modalBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.modalDivider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header with close button
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Әлі аккаунтыңыз жоқ па?',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textOnDarkPrimary,
                    ),
                  ),
                ),
                if (onClose != null)
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textOnDarkSecondary,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Tabs
            Container(
              decoration: BoxDecoration(
                color: AppColors.modalSurface,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: isLogin ? null : onToggleMode,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color:
                              isLogin ? Colors.white : Colors.transparent,
                        ),
                        child: Text(
                          'Кіру',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isLogin
                                ? AppColors.modalBackground
                                : AppColors.textOnDarkSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: !isLogin ? null : onToggleMode,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color:
                              !isLogin ? Colors.white : Colors.transparent,
                        ),
                        child: Text(
                          'Тіркелу',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: !isLogin
                                ? AppColors.modalBackground
                                : AppColors.textOnDarkSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Form fields
            Column(
              children: [
                _buildLabel('Электронды пошта'),
                _buildTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                _buildLabel('Құпиясөз'),
                _buildTextField(
                  controller: passwordController,
                  obscureText: true,
                  showVisibilityToggle: true,
                ),

                if (!isLogin && confirmPasswordController != null) ...[
                  const SizedBox(height: 20),
                  _buildLabel('Құпиясөзді растау'),
                  _buildTextField(
                    controller: confirmPasswordController!,
                    obscureText: true,
                    showVisibilityToggle: true,
                  ),
                ],

                const SizedBox(height: 20),

                // Remember me and Forgot password
                if (isLogin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                if (value != null &&
                                    onRememberMeChanged != null) {
                                  onRememberMeChanged!(value);
                                }
                              },
                              checkColor: AppColors.modalBackground,
                              side: const BorderSide(
                                color: AppColors.textOnDarkSecondary,
                              ),
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  if (states
                                      .contains(MaterialState.selected)) {
                                    return Colors.white;
                                  }
                                  return Colors.transparent;
                                },
                              ),
                            ),
                          ),
                          const Text(
                            'Мені есте сақта',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textOnDarkPrimary,
                            ),
                          ),
                        ],
                      ),
                      if (onForgotPassword != null)
                        TextButton(
                          onPressed: onForgotPassword,
                          child: const Text(
                            'Құпиясөзді ұмыттыңыз ба?',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                    ],
                  ),

                const SizedBox(height: 24),

                // Primary action button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPrimaryAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.modalBackground,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: Text(isLogin ? 'Кіру' : 'Тіркелу'),
                  ),
                ),

                const SizedBox(height: 24),

                // Separator
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.modalDivider,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Немесе',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textOnDarkSecondary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.modalDivider,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Google sign in button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onGoogleSignIn,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: const BorderSide(color: AppColors.modalDivider),
                      backgroundColor: AppColors.modalSurface,
                      foregroundColor: AppColors.textOnDarkPrimary,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'G',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('Google арқылы жалғастыру'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textOnDarkSecondary,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType? keyboardType,
    bool showVisibilityToggle = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(
        color: AppColors.textOnDarkPrimary,
        fontSize: 15,
      ),
      cursorColor: Colors.white70,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.modalSurface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.modalDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        suffixIcon: showVisibilityToggle
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: AppColors.textOnDarkSecondary,
                ),
              )
            : null,
      ),
    );
  }
}

