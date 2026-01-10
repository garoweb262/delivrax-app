import 'package:delivrax/src/feature/home/presentation/views/control_screen.dart';

import '../../../../core/packages.dart';

class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.spacingH,
                Text(
                  'Verify Code',
                  style: AppTextStyle.bodyText1Bg.copyWith(
                    color: AppColors.white,
                    fontSize: 28.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                Text(
                  'Enter the 6-digit code sent to your phone',
                  style: AppTextStyle.bodyText2.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                ),
                50.spacingH,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50).r,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Column(
                    children: [
                      PinCodeField(),
                      Text(
                        '00:45',
                        style: AppTextStyle.button.copyWith(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0).r,
                        child: Text.rich(
                          TextSpan(
                            text: 'Didn’t receive the code? ',
                            children: [
                              TextSpan(
                                text: 'Resend',
                                style: TextStyle().copyWith(
                                  color: AppColors.primary,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: AppTextStyle.bodyText1.copyWith(fontSize: 14),
                        ),
                      ),
                      LoadingButton(
                        isLoading: false,
                        onPressed: () {
                          pushToAndClearStack(context, ControlScreen());
                        },
                        child: Text('Verify', style: AppTextStyle.pryBtnStyle),
                      ),
                      10.spacingH,
                      Text(
                        'Change Phone Number',
                        style: AppTextStyle.bodyText1.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
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
