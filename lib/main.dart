import '/package.dart';
import '/src/core/packages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final theme = ref.watch(themeProvider);
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: AssetConstants.appName,
            theme: AppTheme.medium,
            themeMode: mode,
            // theme: darkTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorKey.myKey,
            home: SplashScreen(),
            builder: (context, child) {
              return MediaQuery.withClampedTextScaling(
                maxScaleFactor: largeTextScaleFactor,
                minScaleFactor: smallTextScaleFactor,
                child: child!,
              );
            },
            // home: ControlScreen(),
          );
        },
      ),
    );
  }
}
