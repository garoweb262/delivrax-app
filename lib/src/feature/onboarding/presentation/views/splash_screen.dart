import '../../../../core/packages.dart';
import '../../../auth/presentation/views/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    navigateHome();
    super.initState();
  }

  navigateHome() {
    Future.delayed(const Duration(seconds: 3), () {
      pushToAndClearStack(context, LoginScreen());
    });
  }

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
          child: Column(
            children: [
              Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Devilra',
                    style: AppTextStyle.headline2S.copyWith(
                      color: AppColors.white,
                      fontSize: 40.sp,
                      fontWeight: AppFontWeight.extraBold,
                    ),
                  ),
                  SvgWidget(AssetConstants.applogo),
                ],
              ),
              Spacer(flex: 2),
              LottiesWidget(name: AssetConstants.purple, height: 150.h),
              Text(
                'Deliver Faster. Deliver Smarter',
                style: AppTextStyle.headline3.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
              20.spacingH,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                child: Text(
                  'Powered by Muaga',
                  style: AppTextStyle.bodyText5.copyWith(
                    color: AppColors.white,
                    fontWeight: AppFontWeight.light,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
