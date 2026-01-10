// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../packages.dart';

class OverlayWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? lead;
  final Color? bgColor;
  final Widget? subBar;
  final Widget? leadIcon;
  final Widget? bottomBar;
  final bool showNav;
  final bool bottomSafe;
  final EdgeInsetsGeometry? contentPadding;
  const OverlayWidget({
    super.key,
    required this.title,
    required this.child,
    this.lead,
    this.bgColor,
    this.contentPadding,
    this.leadIcon,
    this.subBar,
    this.bottomBar,
    this.showNav = true,
    this.bottomSafe = false,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? AppColors.scafoldBackground,
      bottomNavigationBar: bottomBar,
      body: SafeArea(
        bottom: bottomSafe,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24.0, 20, 24, 0).r,
              width: double.infinity,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:
                              showNav
                                  ? GestureDetector(
                                    onTap: () {
                                      mayPop(context);
                                    },
                                    child:
                                        leadIcon ?? Icon(Icons.arrow_back_ios),
                                  )
                                  : SizedBox(),
                        ),
                      ),
                      Text(
                        title,
                        maxLines: 2,
                        style: AppTextStyle.headline3.copyWith(
                          fontSize: 20.sp,
                          fontWeight: AppFontWeight.semiBold,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: lead != null ? lead! : SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  if (subBar != null) subBar!,
                  20.0.spacingH,
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 1).r,
              child: AppDivider(),
            ),
            Expanded(
              child: Padding(
                padding:
                    contentPadding ?? EdgeInsets.fromLTRB(24.0, 0, 24, 0).r,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
