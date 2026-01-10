import 'package:delivrax/src/feature/home/presentation/views/control_screen.dart';

import '../../../../core/packages.dart';

class RegisteredScreen extends ConsumerStatefulWidget {
  const RegisteredScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisteredScreenState();
}

class _RegisteredScreenState extends ConsumerState<RegisteredScreen> {
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
                  'Create Account',
                  style: AppTextStyle.bodyText1Bg.copyWith(
                    color: AppColors.white,
                    fontSize: 28.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                Text(
                  'Fill in your details to continue',
                  style: AppTextStyle.bodyText2.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                ),
                50.spacingH,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50).r,
                  decoration: BoxDecoration(
                    color: AppColors.whitepurple,
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Column(
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          AppTextField(
                            title: 'Business name',
                            hint: 'Enter business name',
                            type: TextInputType.text,
                          ),
                          AppTextField(
                            title: 'Phone number',
                            hint: 'e.g 09011223344',
                            type: TextInputType.text,
                          ),
                          AppTextField(
                            title: 'Business type',
                            hint: 'e.g Retail, Restaurant, Services, etc.',
                            type: TextInputType.text,
                          ),
                          AppTextField(
                            title: 'Business Address',
                            hint: 'e.g Adedokun street, CBD Abuja',
                            type: TextInputType.text,
                          ),
                          AppTextField(
                            title: 'Password',
                            hint: '•••••••••••',
                            type: TextInputType.text,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                        child: Row(
                          children: [
                            Checkbox.adaptive(
                              activeColor: AppColors.primary,
                              // checkColor: AppColors.white,
                              value: false,
                              onChanged: (value) {},
                            ),
                            Text(
                              'I agree to the terms and conditions',
                              style: AppTextStyle.bodyText4,
                            ),
                          ],
                        ),
                      ),
                      LoadingButton(
                        isLoading: false,
                        onPressed: () {
                          pushToAndClearStack(context, ControlScreen());
                        },
                        child: Text(
                          'Create Account',
                          style: AppTextStyle.pryBtnStyle,
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
