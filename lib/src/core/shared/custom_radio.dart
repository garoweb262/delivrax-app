import '../packages.dart';
import '../packages.dart';

class CustomRadio extends StatelessWidget {
  // final String title;
  final id;
  final initial;
  final VoidCallback onTap;
  const CustomRadio({
    required this.initial,
    required this.onTap,
    required this.id,
    // required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: id == initial ? AppColors.primary : AppColors.appGrey,
          ),
        ),
        child:
            id == initial
                ? CircleAvatar(radius: 8.h, backgroundColor: AppColors.primary)
                : CircleAvatar(
                  radius: 8.h,
                  backgroundColor: Colors.transparent,
                ),
      ),
    );
  }
}
