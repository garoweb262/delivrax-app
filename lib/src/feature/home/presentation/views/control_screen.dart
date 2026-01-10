import 'package:delivrax/src/feature/home/presentation/views/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/packages.dart';

// import 'discovery_screen.dart';
// import 'staggard_view.dart';

class ControlScreen extends ConsumerStatefulWidget {
  final int intialPage;
  const ControlScreen({this.intialPage = 0, super.key});

  @override
  ConsumerState<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends ConsumerState<ControlScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.intialPage);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentIndex = widget.intialPage;
      setState(() {});
      // provider.start();
    });
    Future.delayed(Duration.zero).then((_) {});
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final color = context.theme.colorScheme.surface;

    // provider.start();
    return Scaffold(
      body: PageView(
        // scrollBehavior: ,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [DashboardScreen()],
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 60.h,
        backgroundColor: AppColors.white,
        currentIndex: currentIndex,
        onTap: (value) {
          _pageController.jumpToPage(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          NaviItem(AssetConstants.home, 0, currentIndex, 'Home'),
          NaviItem(AssetConstants.box, 1, currentIndex, 'Orders'),
          NaviItem(AssetConstants.create, 2, currentIndex, 'Create'),
          NaviItem(AssetConstants.wallet, 3, currentIndex, 'Wallet'),
          NaviItem(AssetConstants.profile, 4, currentIndex, 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem NaviItem(
    String icons,
    int myIndex,
    int pageIndex,
    String title,
  ) {
    // final color = context.theme.colorScheme.secondary;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 5.0).r,
        child: Column(
          children: [
            // 10.0.spacingH,
            SizedBox(
              height: 30.h,
              child: SvgWidget(
                icons,
                color: pageIndex == myIndex
                    ? AppColors.primary
                    : AppColors.appDark,
              ),
            ),
            1.0.spacingH,
            Text(
              title,
              style: AppTextStyle.bodyText1.copyWith(
                fontSize: 12.sp,
                fontWeight: AppFontWeight.medium,
                color: pageIndex == myIndex
                    ? AppColors.primary
                    : AppColors.appDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
