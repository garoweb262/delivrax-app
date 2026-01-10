// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../packages.dart';

class AppDivider extends StatelessWidget {
 final Color? color;
  const AppDivider({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0).r,
        color: color?? Color(0xFF081200).withOpacity(0.12),
      ),
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        color: AppColors.gray,
      ),
    );
  }
}
