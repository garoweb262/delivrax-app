import '../../../../core/packages.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10).r,
      decoration: AppColors.boxDeco,
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Order ID: SL-5352',
                  style: AppTextStyle.bodyText2.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                Text(
                  'Route: Ojodu → Ikorodu Garage',
                  style: AppTextStyle.formTextS.copyWith(
                    color: AppColors.greyBlack,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                Text(
                  'Time: 2 hr ago',
                  style: AppTextStyle.formTextSS.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.redLight,
            ),
            child: Text(
              'CANCELLED',
              style: AppTextStyle.bodyText3.copyWith(
                color: AppColors.white,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
