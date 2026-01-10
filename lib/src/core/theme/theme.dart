import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/src/core/theme/colors.dart';
import '/src/core/typography/typography.dart';

const smallTextScaleFactor = 0.80;
const largeTextScaleFactor = 1.20;

/// Namespace for the App [ThemeData].
class AppTheme {
  /// Standard `ThemeData` for App UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.primary,
        primarySwatch: Colors.deepPurple,
      ),
      appBarTheme: _appBarTheme,
      useMaterial3: true,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,

      // switchTheme: SwitchThemeData(
      // ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        refreshBackgroundColor: AppColors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),

      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStatePropertyAll(AppColors.white),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(color: AppColors.greyText),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        fillColor: WidgetStatePropertyAll(AppColors.transparent),
      ),
      scaffoldBackgroundColor: AppColors.white,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      dividerTheme: _dividerTheme,
    );
  }

  /// `ThemeData` for App UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for App UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1,
      displayMedium: AppTextStyle.headline2,
      displaySmall: AppTextStyle.headline3,
      headlineMedium: AppTextStyle.headline4,
      headlineSmall: AppTextStyle.headline5,
      titleLarge: AppTextStyle.headline6,
      titleMedium: AppTextStyle.subtitle1,
      titleSmall: AppTextStyle.subtitle2,
      bodyLarge: AppTextStyle.bodyText1,
      bodyMedium: AppTextStyle.bodyText2,
      bodySmall: AppTextStyle.caption,
      labelSmall: AppTextStyle.overline,
      labelLarge: AppTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * smallTextScaleFactor,
      ),
      displayMedium: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * smallTextScaleFactor,
      ),
      displaySmall: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * smallTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * smallTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * smallTextScaleFactor,
      ),
      titleLarge: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * smallTextScaleFactor,
      ),
      titleMedium: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * smallTextScaleFactor,
      ),
      titleSmall: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * smallTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * smallTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * smallTextScaleFactor,
      ),
      bodySmall: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * smallTextScaleFactor,
      ),
      labelSmall: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * smallTextScaleFactor,
      ),
      labelLarge: AppTextStyle.button.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * largeTextScaleFactor,
      ),
      displayMedium: AppTextStyle.headline2.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * largeTextScaleFactor,
      ),
      displaySmall: AppTextStyle.headline3.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * largeTextScaleFactor,
      ),
      headlineMedium: AppTextStyle.headline4.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * largeTextScaleFactor,
      ),
      headlineSmall: AppTextStyle.headline5.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * largeTextScaleFactor,
      ),
      titleLarge: AppTextStyle.headline6.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * largeTextScaleFactor,
      ),
      titleMedium: AppTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * largeTextScaleFactor,
      ),
      titleSmall: AppTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * largeTextScaleFactor,
      ),
      bodyLarge: AppTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * largeTextScaleFactor,
      ),
      bodyMedium: AppTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * largeTextScaleFactor,
      ),
      bodySmall: AppTextStyle.caption.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * largeTextScaleFactor,
      ),
      labelSmall: AppTextStyle.overline.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * largeTextScaleFactor,
      ),
      labelLarge: AppTextStyle.button.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        //primary: AppColors.primary,
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: Color(0xFFEBF0FF), width: 1.5),
        foregroundColor: AppColors.white,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: AppColors.white),
    );
  }

  static DialogThemeData get _dialogTheme {
    return DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarThemeData get _tabBarTheme {
    return const TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: AppColors.primary),
      ),
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1.2,
      color: Color(0xFFEBF0FF),
    );
  }
}
