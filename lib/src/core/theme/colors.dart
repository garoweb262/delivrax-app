// import '/packages.dart';
import '/src/core/packages.dart';

/// Defines the color palette for the App UI.
abstract class AppColors {
  /// Black
  static const Color black = Color(0xFF202124);

  /// Black 54% opacity
  static const Color black54 = Color(0x8A000000);
  static const Color greyBlack = Color(0xFF5D6368);
  static const Color scafoldBackground = Color(0xFFF4F4F4);
  static const Color hintGrey = Color(0xFFB4B8B4);

  /// Black 25% opacity
  static const Color black25 = Color(0x40202124);

  /// Gray b4b4b4
  static const Color gray = Color(0xFFEBEBEB);

  /// DarkGray
  static const Color darkGray = Color(0xFFB4B4B4);

  /// White
  static const Color white = Color(0xFFFFFFFF);
  static const Color whitepurple = Color(0xFFD3CED7);

  /// WhiteBackground
  static const Color whiteBackground = Color(0xFFE8EAED);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Primary
  static const Color primary = Color(0xFF5A1786);
  static const Color primaryDeep = Color(0xFF0F8044);
  static const Color darkPrimary = Color(0xFF004833);
  static const Color yellowPrimary = Color(0xFFE4AA3D);
  static const Color pryLight = Color(0xFFB58DD0);
  static const Color formGrey = Color(0xFF929392);

  static const Color blackLight = Color(0xFF00100B);
  static const Color gradientBlack = Color(0xFF020104);

  /// Secondary
  static const Color secondary = Color(0xFFFF7C3E);

  /// Green
  static const Color green = Color(0xFF009A49);
  // static const Color greenlight = Color(0xFF00BC74);
  static const Color greenFill = Color(0xFF003B2A);

  /// Orange
  static const Color orange = Color(0xFFF0B546);
  static const Color deepOrange = Color(0xFF9C6C12);

  /// Charcoal
  static const Color charcoal = Color(0xBF202124);

  static const Color red = Color(0xFFF96969);

  static const Color appDark = Color(0xFF9098B1);
  static const Color appGrey = Color(0xFF9098B1);
  static const Color appGrey2 = Color(0xFF797D7C);
  static const Color appDarkGrey = Color(0xFF626262);

  static const Color bodyColor = Color(0xFF1E1E1E);

  static const Color appBlue = Color(0xFF2093F4);

  // Grey Text
  static const Color greyText = Color(0xFFA0A4C4);
  static const Color grey = Color(0xFFDADADA);
  static const Color greyLight = Color(0xFFF7F7F7);
  static const Color greyLightA = Color(0xFFF4F4F4);
  static const Color greenLightA = Color(0xFFF0FFEF);
  static const Color greyTxt = Color(0xFFA3A3A3);
  static const Color redLight = Color(0xFFE0333C);
  static const Color greenLight = Color(0xFF14A800);
  static const Color yellowLight = Color(0xFFE4AA3D);
  static const Color orangeLight = Color(0xFFFFF0D4);

  static const Color blueLight = Color(0xFF314BCE);

  static const Color purple = Color(0xFFF948F9);
  static const BoxShadow cardShadow = BoxShadow(
    blurRadius: 6,
    color: AppColors.grey,
    offset: Offset(0, 6),
  );
  static const BoxShadow cardShadow2 = BoxShadow(
    blurRadius: 6,
    color: AppColors.grey,
    offset: Offset(0, -6),
  );

  static BoxDecoration boxDeco = BoxDecoration(
    borderRadius: BorderRadius.circular(10).r,
    color: AppColors.white,
  );
}
