import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:project/core/assets/app_icons.dart';
import 'package:project/core/theme/app_colors.dart';
import 'package:project/core/widgets/custom_keyboard.dart';
import 'package:project/features/auth/cubit/auth_cubit.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/presentation/pages/complete_page.dart';

class VerificationPage extends StatefulWidget {
  final TextEditingController verifiedEmail;
  const VerificationPage({super.key, required this.verifiedEmail});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController pinputController = TextEditingController();
  void _onKeyTap(String value) {
    setState(() {
      pinputController.text += value;
    });
  }

  void _onBackspace() {
    if (pinputController.text.isNotEmpty) {
      setState(() {
        pinputController.text = pinputController.text.substring(
          0,
          pinputController.text.length - 1,
        );
      });
    }
  }

  void showloading() {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.black.withValues(alpha: .1),
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.arrowLeftOutline),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Verification Email',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Please enter the code we just sent to email \n',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: widget.verifiedEmail.text,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      showloading();
                    } else {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    }

                    if (state is AuthError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }

                    if (state is AuthSuccess) {
                      if (state.message != "Invalid OTP" &&
                          state.message !=
                              "Verification code sent to your email.") {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompletePage(),
                          ),
                          (route) => false,
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    return Pinput(
                      onCompleted: (pin) => context.read<AuthCubit>().verify(
                        email: widget.verifiedEmail.text,
                        otp: pin,
                      ),
                      enabled: false,
                      controller: pinputController,
                      length: 4,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      keyboardType: TextInputType.number,
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 2,
                            height: 25,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),

                      defaultPinTheme: PinTheme(
                        width: 52,
                        height: 52,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade900,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 52,
                        height: 52,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade900,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'If you didn\'t receive a code? ',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 43),

                SizedBox(height: 24),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: AppColors.primaryColor,
              child: CustomKeyboard(
                onKeyTap: _onKeyTap,
                onBackspace: _onBackspace,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
