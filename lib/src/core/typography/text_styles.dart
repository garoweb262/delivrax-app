import 'package:delivrax/src/core/packages.dart';

/// App Text Style Definitions
class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    color: AppColors.black,
    fontFamily: 'Inter',
    // fontFamily: GoogleFonts.genos().fontFamily,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 22.sp,
      fontFamily: 'Inter',
      // fontFamily: GoogleFonts.lato().fontFamily,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get headline2S {
    return _baseTextStyle.copyWith(
      fontSize: 24.sp,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 18.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  //secondary button style
  static TextStyle get secBtnStyle {
    return AppTextStyle.headline3.copyWith(
      fontWeight: AppFontWeight.medium,
      fontSize: 18.sp,
    );
  }

  //secondary primary style
  static TextStyle get pryBtnStyle {
    return AppTextStyle.headline3.copyWith(
      fontWeight: AppFontWeight.semiBold,
      fontSize: 16.sp,
      color: AppColors.white,
    );
  }

  static TextStyle priBtnSty([bool isEnable = true]) {
    return AppTextStyle.headline3.copyWith(
      fontWeight: AppFontWeight.medium,
      fontSize: 15.sp,
      color: isEnable ? AppColors.black : AppColors.black54,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 19.sp,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 12.sp,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 15.5.sp,
      //letterSpacing: 0.3,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      color: AppColors.appDark,
      fontWeight: AppFontWeight.bold,
    );
  }

  static TextStyle get subtitleStyle {
    return _baseTextStyle.copyWith(
      fontSize: 15.sp,
      color: AppColors.formGrey,
      // fontWeight: AppFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 16.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get bodyText1Bg {
    return _baseTextStyle.copyWith(
      fontSize: 17.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.light,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText3 {
    return _baseTextStyle.copyWith(
      fontSize: 11.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get bodyText4 {
    return _baseTextStyle.copyWith(
      fontSize: 12.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get bodyText4M {
    return _baseTextStyle.copyWith(
      fontSize: 12.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get bodyText5 {
    return _baseTextStyle.copyWith(
      fontSize: 15.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get bodyText5M {
    return _baseTextStyle.copyWith(
      fontSize: 15.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get captionM {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16.sp,
      fontWeight: AppFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 17.sp,
      color: AppColors.white,
      fontWeight: AppFontWeight.bold,
    );
  }

  /// Button Text Style
  static TextStyle get appBarTitle {
    return _baseTextStyle.copyWith(
      fontSize: 20.sp,
      color: AppColors.appDark,
      fontWeight: AppFontWeight.medium,
    );
  }

  /// Button Text Style
  static TextStyle get caption2 {
    return _baseTextStyle.copyWith(
      fontSize: 12.sp,
      color: AppColors.white,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get mediumTxt {
    return _baseTextStyle.copyWith(
      fontSize: 12.sp,
      color: AppColors.appDark,
      fontWeight: AppFontWeight.medium,
    );
  }

  static TextStyle get formText {
    return _baseTextStyle.copyWith(
      fontSize: 15.sp,
      color: AppColors.formGrey,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get formTextS {
    return _baseTextStyle.copyWith(
      fontSize: 14.sp,
      color: AppColors.formGrey,
      fontWeight: AppFontWeight.regular,
    );
  }

  static TextStyle get formTextSS {
    return _baseTextStyle.copyWith(
      fontSize: 13.sp,
      color: AppColors.formGrey,
      fontWeight: AppFontWeight.regular,
    );
  }
}
