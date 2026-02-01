// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/packages.dart';
import '../../model/order_model.dart';
import '../../repository/order_repository.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel model;
  const OrderWidget({super.key, required this.model});

  getAppColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return ['Cancel Order', AppColors.yellowPrimary];
      case OrderStatus.completed:
        return ['', AppColors.green];
      case OrderStatus.active:
        return ['Track Order', AppColors.appBlue];
      case OrderStatus.cancelled:
        return ['', AppColors.redLight];

      default:
        return ['', AppColors.white];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10).r,
      decoration: AppColors.boxDeco,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            crossAxisAlignment: .start,
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
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: getAppColor(model.status)[1],
                ),
                child: Text(
                  // 'CANCELLED',
                  model.status.name.toUpperCase(),
                  style: AppTextStyle.bodyText3.copyWith(
                    color: AppColors.white,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
              ),
            ],
          ),

          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            ),
            onPressed: () {},
            child: Text(
              getAppColor(model.status)[0],
              style: AppTextStyle.bodyText4M.copyWith(color: AppColors.appBlue),
            ),
          ),
        ],
      ),
    );
  }
}
