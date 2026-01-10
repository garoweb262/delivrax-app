import '../packages.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final String title;
  final String subTitle;
  final double? padding;
  final bool shoWLeading;
  final bool? shoWNav;
  final String? maxNum;
  final String? currentNum;
  final ScrollPhysics? physics;
  const ScaffoldBody({
    super.key,
    required this.child,
    required this.title,
    this.shoWLeading = false,
    this.shoWNav,
    this.currentNum,
    this.physics,
    this.maxNum,
    this.padding,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: physics,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(25.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.0.spacingH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (shoWNav ?? true)
                          GestureDetector(
                            onTap: () {
                              mayPop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15).r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary.withOpacity(0.06),
                              ),
                              child: SvgWidget(AssetConstants.arrowback),
                            ),
                          ),
                        shoWLeading
                            ? Container(
                              height: 45.h,
                              width: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                shape: BoxShape.circle,
                                // color: AppColors.primary,
                              ),
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: currentNum,
                                        style: AppTextStyle.bodyText4M.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      TextSpan(text: '/$maxNum'),
                                    ],
                                  ),
                                  style: AppTextStyle.bodyText4M.copyWith(
                                    color:
                                        currentNum == maxNum
                                            ? AppColors.primary
                                            : AppColors.appGrey,
                                  ),
                                ),
                              ),
                            )
                            : Container(),
                      ],
                    ),
                    40.0.spacingH,
                    Text(
                      title,
                      style: AppTextStyle.headline4.copyWith(fontSize: 25.sp),
                    ),
                    // 10.0.spacingH,
                    Text(subTitle, style: AppTextStyle.subtitleStyle),
                    20.0.spacingH,
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class ScaffoldBodyNoScroll extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? padding;
  final bool shoWLeading;
  final bool? shoWNav;
  final String? maxNum;
  final String? currentNum;

  const ScaffoldBodyNoScroll({
    super.key,
    required this.title,
    this.shoWLeading = false,
    this.shoWNav,
    this.currentNum,
    this.maxNum,
    this.padding,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (shoWNav ?? true)
                    GestureDetector(
                      onTap: () {
                        pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyLight,
                        ),
                        child: SvgWidget(AssetConstants.arrowback),
                      ),
                    ),
                  shoWLeading
                      ? Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          shape: BoxShape.circle,
                          // color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: currentNum,
                                  style: AppTextStyle.bodyText4M.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                TextSpan(text: '/$maxNum'),
                              ],
                            ),
                            style: AppTextStyle.bodyText4M.copyWith(
                              color:
                                  currentNum == maxNum
                                      ? AppColors.primary
                                      : AppColors.appGrey,
                            ),
                          ),
                        ),
                      )
                      : Container(),
                ],
              ),
              20.0.spacingH,
              Text(
                title,
                style: AppTextStyle.headline4.copyWith(fontSize: 25.sp),
              ),
              // 10.0.spacingH,
              Text(subTitle, style: AppTextStyle.formText),
              20.0.spacingH,
            ],
          ),
        ),
      ],
    );
  }
}
