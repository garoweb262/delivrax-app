import '/src/core/packages.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.child,
    this.onTap,
    this.color,
    this.borderColor,
    super.key,
  });
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color ?? context.colors.onInverseSurface,

        // backgroundColor: ,
        side: BorderSide(color: borderColor ?? AppColors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30).r,
        ),
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
      ),
      onPressed: onTap,
      child: Stack(children: [Center(child: child)]),
    );
  }
}
