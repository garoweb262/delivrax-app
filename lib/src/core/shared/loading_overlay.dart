import 'package:loading_overlay/loading_overlay.dart';

import '../packages.dart';

class LoadingOverlayer extends StatelessWidget {
  const LoadingOverlayer({
    required this.isLoading,
    required this.child,
    super.key,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      // opacity: 1,
      color: AppColors.white,
      progressIndicator: LoadingIndicator(),
      child: child,
    );
  }
}
