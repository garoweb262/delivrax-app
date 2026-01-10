import 'dart:ui';

import '../packages.dart';
// import '../../../features/auth/repository/local_auth.dart';

Future<dynamic> bottomSheet(BuildContext context, Widget child,
    [isDimiss = true]) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDimiss,
    backgroundColor: AppColors.transparent,
    builder: (context) => SafeArea(
      bottom: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        child: child,
      ),
    ),
  );
}

Future<dynamic> showAppDialog(BuildContext context, Widget child,
    [double height = 300]) {
  return showDialog(
    context: context,
    builder: (context) => SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        child: Center(
          child: Container(
              height: height.h,
              margin: EdgeInsets.all(24).r,
              padding: EdgeInsets.all(24).r,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r),
              child: child),
        ),
      ),
    ),
  );
}

showSuccessModel(
  BuildContext context,
  String message,
  details, [
  VoidCallback? onPressed,
  String buttonText = 'Okay',
  String icon = AssetConstants.success,
  bool isDismissed = true,
]) {
  bottomSheet(
      context,
      Container(
        height: 400.h,
        width: double.infinity,
        padding: EdgeInsets.all(25).r,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20).r,
            topLeft: Radius.circular(20).r,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0).r,
              child: BottomSheetDivider(),
            ),
            Spacer(),
            SvgWidget(
              AssetConstants.success,
              height: 100.h,
            ),
            10.0.spacingH,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.headline2
                  .copyWith(fontWeight: AppFontWeight.semiBold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50).r,
              child: Text(
                details,
                textAlign: TextAlign.center,
                style: AppTextStyle.formText,
              ),
            ),
            Spacer(),
            LoadingButton(
              child: Text(
                buttonText,
                style: AppTextStyle.pryBtnStyle,
              ),
              isLoading: false,
              onPressed: onPressed,
            ),
            10.0.spacingH
          ],
        ),
      ),
      isDismissed);
}

infoBottomSheet(
    BuildContext context, String title, String subtitle, String btnText,
    [double? height, Function? onPress]) {
  return bottomSheet(
    context,
    Container(
      height: height ?? height350,
      padding: EdgeInsets.all(20).r,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(30).r)
              .r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                pop(context);
              },
              child: SvgWidget(
                AssetConstants.close,
              ),
            ),
          ),
          LottiesWidget(
            name: AssetConstants.success,
            height: 80.h,
          ),
          30.0.spacingH,
          Text(
            // 'Payment Received',
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.headline6.copyWith(fontSize: 20),
          ),
          10.0.spacingH,
          Text(
            // 'NGN 5000 payment has been received',
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.formText,
          ),
          Spacer(),
          LoadingButton(
            child: Text(
              // 'View Details',
              btnText,
              style: AppTextStyle.pryBtnStyle,
            ),
            isLoading: false,
            onPressed: () {},
          ),
          20.0.spacingH
        ],
      ),
    ),
  );
}

Future<dynamic> setBioSheet(BuildContext context) {
  return bottomSheet(
    context,
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      height: height350,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20).r,
          topLeft: Radius.circular(20).r,
        ),
      ),
      child: Column(
        children: [
          20.0.spacingH,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150.0).r,
            child: BottomSheetDivider(),
          ),
          20.0.spacingH,
          Text(
            'Biometric',
            style: AppTextStyle.headline2
                .copyWith(fontWeight: AppFontWeight.semiBold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
            child: Text(
              'Place your finger on your fingerprint sensor',
              textAlign: TextAlign.center,
              style: AppTextStyle.formText,
            ),
          ),
          30.0.spacingH,
          ImageWidget(AssetConstants.fingerprint),
          20.0.spacingH
        ],
      ),
    ),
  );
}
