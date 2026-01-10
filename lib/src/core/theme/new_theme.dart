import '../packages.dart';

final themeProvider = Provider<ThemeData>((ref) {
  final mode = ref.watch(themeModeProvider);
  switch (mode) {
    case ThemeMode.light:
      return lightTheme;
    case ThemeMode.dark:
      return darkTheme;
    default:
      return lightTheme;
  }
});
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F0F0F),
  primaryColor: AppColors.primary,
  fontFamily: 'Poppins', // ✅ Set once here for all text styles
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: Colors.white,
    // surface: Color(0xFF1E1E1E),
    surface: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.white70,
    onSurface: Colors.white,
    onInverseSurface: AppColors.white,

  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF0F0F0F),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white60,
    selectedIconTheme: IconThemeData(size: 28),
    unselectedIconTheme: IconThemeData(size: 24),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),
  cardTheme: const CardThemeData(
    color: Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    elevation: 2,
    margin: EdgeInsets.all(8),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white54,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.white54,
    ),
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Pure white background
  primaryColor: AppColors.primary, // Pinterest red
  fontFamily: 'Poppins', // Set once for all text styles

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: Colors.black,
    // surface: Color(0xFFF2F2F2),
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black87,
    onSurface: Colors.black,
    onInverseSurface: AppColors.grey,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black54,
    selectedIconTheme: IconThemeData(size: 28),
    unselectedIconTheme: IconThemeData(size: 24),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),

  cardTheme: const CardThemeData(
    color: Color(0xFFF9F9F9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    elevation: 2,
    margin: EdgeInsets.all(8),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black45,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.black38,
    ),
  ),
);
