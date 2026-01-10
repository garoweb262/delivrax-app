import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../packages.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SpinKitWaveSpinner(
                waveColor: AppColors.primary,
                curve: Curves.linear,
                trackColor: Colors.black12,
                controller: _animationController,
                size: 100.h,
                color: AppColors.primary,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgWidget(AssetConstants.applogo, height: 40.h),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallProgress extends StatelessWidget {
  const SmallProgress({
    this.color = AppColors.primary,
    this.margin = 20,
    this.size = 10,
    super.key,
  });
  final Color color;
  final double margin;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.h,
      width: size.h,
      margin: EdgeInsets.all(margin).r,
      child: CircularProgressIndicator(
        // backgroundColor: AppColors.black25,
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
