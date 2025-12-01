import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AuthModal extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggleMode;
  final VoidCallback? onClose;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? birthDateController;
  final TextEditingController? phoneController;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback onPrimaryAction;
  final VoidCallback onGoogleSignIn;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onBirthDateTap;

  const AuthModal({
    Key? key,
    required this.isLogin,
    required this.onToggleMode,
    this.onClose,
    this.firstNameController,
    this.lastNameController,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    this.birthDateController,
    this.phoneController,
    this.rememberMe = false,
    this.onRememberMeChanged,
    required this.onPrimaryAction,
    required this.onGoogleSignIn,
    this.onForgotPassword,
    this.onBirthDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final closeAction = onClose ?? () => Navigator.of(context).maybePop();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.modalBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
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
                IconButton(
                  splashRadius: 20,
                  onPressed: closeAction,
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
                color: const Color(0xFFF2F2F7),
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
                          color: isLogin ? Colors.white : Colors.transparent,
                          boxShadow: isLogin
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          'Кіру',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isLogin
                                ? AppColors.textOnDarkPrimary
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
                          color: !isLogin ? Colors.white : Colors.transparent,
                          boxShadow: !isLogin
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          'Тіркелу',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: !isLogin
                                ? AppColors.textOnDarkPrimary
                                : AppColors.textOnDarkSecondary,
                          ),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Form fields
            Column(
              children: [
                if (!isLogin && firstNameController != null) ...[
                  _buildLabel('Есім'),
                  _buildTextField(
                    controller: firstNameController!,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                ],
                if (!isLogin && lastNameController != null) ...[
                  _buildLabel('Тегі'),
                  _buildTextField(
                    controller: lastNameController!,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                ],

                _buildLabel('Электронды пошта'),
                _buildTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                  const SizedBox(height: 24),

                if (!isLogin && birthDateController != null) ...[
                  _buildLabel('Туған күн'),
                  _buildTextField(
                    controller: birthDateController!,
                    readOnly: true,
                    onTap: onBirthDateTap,
                    suffix: IconButton(
                      onPressed: onBirthDateTap,
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.textOnDarkSecondary,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                if (!isLogin && phoneController != null) ...[
                  _buildLabel('Телефон номер'),
                  _buildTextField(
                    controller: phoneController!,
                    keyboardType: TextInputType.phone,
                    prefix: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: AppColors.modalDivider),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('🇰🇿', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.textOnDarkSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

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

                  // Confirm password for register
                  if (!isLogin && confirmPasswordController != null) ...[
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Құпиясөзді растау',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '••••••••',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: const Color(0xFFF6F7F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 16),

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
                              activeColor: AppColors.primary,
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: AppColors.textOnDarkSecondary,
                              ),
                              fillColor: MaterialStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColors.primary;
                                }
                                return Colors.transparent;
                              }),
                            ),
                          ),
                          const Text(
                            'Мені есте сақта',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textOnDarkPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Мені есте сақта',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const Spacer(),
                        if (onForgotPassword != null)
                          GestureDetector(
                            onTap: onForgotPassword,
                            child: Text(
                              'Құпиясөзді ұмыттыңыз ба?',
                              style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xFF0A73FF),
                                fontWeight: FontWeight.w600,
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
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
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

                  const SizedBox(height: 16),

                // Separator
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.modalDivider)),
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
                    Expanded(child: Divider(color: AppColors.modalDivider)),
                  ],
                ),

                  const SizedBox(height: 16),

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
                      backgroundColor: Colors.white,
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
                ],
              ),
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
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? prefix,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: AppColors.textOnDarkPrimary, fontSize: 15),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: prefix,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: showVisibilityToggle
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: AppColors.textOnDarkSecondary,
                ),
              )
            : suffix,
      ),
    );
  }
}
