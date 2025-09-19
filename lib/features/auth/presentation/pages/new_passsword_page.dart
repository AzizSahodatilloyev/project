import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/auth/cubit/auth_cubit.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/presentation/pages/new_password_complete_page.dart';
import 'package:project/features/auth/presentation/widgets/reset_password_formfield.dart';

class NewPassswordPage extends StatefulWidget {
  final String resetToken;
  const NewPassswordPage({super.key, required this.resetToken});

  @override
  State<NewPassswordPage> createState() => _NewPassswordPageState();
}

class _NewPassswordPageState extends State<NewPassswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewPasswordCompletePage(),
                ),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    Text(
                      'Create your new password, so you can login to your account.',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Column(
                  spacing: 16,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        NewResetPassword1(
                          passwordController: _passwordController,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        NewResetPassword2(
                          confirmPasswordController: _confirmPasswordController,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 36),
                AuthButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          final newPassword = _passwordController.text.trim();
                          final confirmPassword = _confirmPasswordController
                              .text
                              .trim();

                          if (newPassword.isEmpty || confirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all fields"),
                              ),
                            );
                            return;
                          }

                          if (newPassword != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Passwords do not match"),
                              ),
                            );
                            return;
                          }

                          context.read<AuthCubit>().newPassword(
                            resetToken: widget.resetToken,
                            newPassword: newPassword,
                          );
                        },
                  title: state is AuthLoading ? "Loading..." : "Continue",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
