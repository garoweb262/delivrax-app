import 'package:delivrax/src/feature/auth/presentation/views/otp_screen.dart';
import 'package:delivrax/src/feature/auth/presentation/views/register_screen.dart';
import 'package:flutter/gestures.dart';

import '../../../../core/packages.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.gradientBlack],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 177, 97, 97),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                height140.spacingH,
                Text(
                  'Welcome Back',
                  style: AppTextStyle.bodyText1Bg.copyWith(
                    color: AppColors.white,
                    fontSize: 28.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                Text(
                  'Login to continue',
                  style: AppTextStyle.bodyText2.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                ),
                50.spacingH,
                AppTextField(
                  hint: 'Email/Phone number',
                  type: TextInputType.text,
                ),
                20.spacingH,
                AppTextField(
                  hint: 'Password',
                  type: TextInputType.text,
                  isPassword: true,
                ),
                5.spacingH,

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: AppTextStyle.bodyText4M.copyWith(
                      color: AppColors.white.withValues(alpha: 0.7),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                30.spacingH,
                LoadingButton(
                  onPressed: () {
                    pushTo(context, OTPScreen());
                  },
                  isLoading: false,
                  child: Text('Login', style: AppTextStyle.pryBtnStyle),
                ),
                20.spacingH,
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',

                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              pushTo(context, RegisteredScreen());
                            },
                          style: TextStyle().copyWith(
                            color: AppColors.pryLight,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                        ),
                      ],
                    ),

                    style: AppTextStyle.bodyText4M.copyWith(
                      color: AppColors.white,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
