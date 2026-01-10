import '../../../../core/packages.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text('Mobile App Template', style: AppTextStyle.bodyText1),
      ),
    );
  }
}
