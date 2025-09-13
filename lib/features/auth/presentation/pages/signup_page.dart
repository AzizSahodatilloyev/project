import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/core/widgets/app_buttons.dart';
import 'package:project/features/auth/cubit/auth_cubit.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/presentation/pages/login_page.dart';
import 'package:project/features/auth/presentation/pages/verification_page.dart';
import 'package:project/features/auth/presentation/widgets/signup_formfields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obsecureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool hasMinimum() {
    return RegExp(r'.{8,}').hasMatch(_passwordController.text);
  }

  bool hasNumber() {
    return RegExp(r'\d').hasMatch(_passwordController.text);
  }

  bool hasLowerAndUpper() {
    return RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(_passwordController.text);
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Sign Up\n',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'Create account and choose favorite menu',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SignupNameField(nameController: _nameController),
                    ],
                  ),
                  Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SignupEmailField(emailController: _emailController),
                    ],
                  ),
                  Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        onChanged: (value) => setState(() {}),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        obscureText: _obsecureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: Color(AppColors.primaryColor),
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                          hintText: 'Your password',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: _obsecureText
                                  ? SvgPicture.asset(
                                      AppIcons.passwordOutline,
                                      width: 24,
                                      height: 24,
                                    )
                                  : SvgPicture.asset(
                                      AppIcons.passwordOutline,
                                      width: 24,
                                      height: 24,
                                    ),
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 12,
                            minWidth: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 24),
              _buildChecker(hasMinimum(), 'Minimum 8 characters'),
              _buildChecker(hasNumber(), 'Atleast 1 number (1-9)'),
              _buildChecker(
                hasLowerAndUpper(),
                'Atleast lowercase or uppercase letters',
              ),
              SizedBox(height: 24),

              Column(
                spacing: 24,
                children: [
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AuthCubit(),
                              child: VerificationPage(
                                verifiedEmail: _emailController,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AuthButton(
                        title: state is AuthLoading ? 'Loading...' : 'Register',
                        onPressed:
                            state is AuthLoading ||
                                !hasMinimum() ||
                                !hasNumber() ||
                                !hasLowerAndUpper()
                            ? null
                            : () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<AuthCubit>().signUp(
                                    email: _emailController.text.trim(),
                                    name: _nameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                                }
                              },
                      );
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Color(AppColors.primaryColor),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'By clicking Register, you agree to our \n',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Data Policy.',
                          style: TextStyle(
                            color: Color(AppColors.primaryColor),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding _buildChecker(bool isCorrect, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      spacing: 10.0,
      children: [
        isCorrect
            ? Icon(Icons.done, color: Color(0xFFA28CE0))
            : Icon(Icons.clear, color: Colors.red),
        Text(text),
      ],
    ),
  );
}
