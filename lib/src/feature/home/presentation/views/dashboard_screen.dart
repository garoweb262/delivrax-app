import '../../../../core/packages.dart';
import '../../../chat/model/onboard_model.dart';
import '../../../orders/model/order_model.dart';
import '../../../orders/presentation/widget/order_widget.dart';
import '../../../orders/repository/order_repository.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  List<OnBoardModel> dashItems = [
    OnBoardModel(title: 'Active Order', subTitle: '3'),
    OnBoardModel(title: 'Completed Today', subTitle: '8'),
    OnBoardModel(title: 'Pending Bids', subTitle: '13'),
    OnBoardModel(
      title: 'Today\'s Earnings',
      subTitle: '156900',
      isAmount: true,
    ),
  ];

  List<OrderModel> orderList = [
    OrderModel(
      title: 'Order ID: SL-432738',
      subTitle: 'Route: Alawusa to Allen Venue',
      status: OrderStatus.active,
    ),
    OrderModel(
      title: 'Order ID: SL-416357',
      subTitle: 'Route: Ikeja to Egbeda Route',
      status: OrderStatus.pending,
    ),
    OrderModel(
      title: 'Order ID: SL-432738',
      subTitle: 'Route: Ikorodu to Elegbeda',
      status: OrderStatus.completed,
    ),
    OrderModel(
      title: 'Order ID: SL-122748',
      subTitle: 'Route: Victoria Island to Epe',
      status: OrderStatus.cancelled,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.gradientBlack],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5).r,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'Hello, SwiftMart Stores',
                                style: AppTextStyle.headline1.copyWith(
                                  color: AppColors.white,
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                              ),
                              Text(
                                'Today • Dec 12, 2025',
                                style: AppTextStyle.bodyText4.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.whitepurple,
                        ),
                        10.spacingW,
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/avater.png',
                          ),
                          backgroundColor: AppColors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                      child: AppTextField(
                        hint: 'Search orders...',
                        prefixIcons: Padding(
                          padding: const EdgeInsets.only(left: 8.0).r,
                          child: SvgWidget(AssetConstants.search),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                        ).copyWith(left: 10).r,
                      ),
                    ),
                  ],
                ),
              ),
              20.spacingH,
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30).r,
                    topRight: Radius.circular(30).r,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
                    decoration: BoxDecoration(color: AppColors.whitepurple),
                    child: ListView(
                      children: [
                        20.spacingH,
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          mainAxisSpacing: 15.h,
                          crossAxisSpacing: 15.h,
                          childAspectRatio: 15 / 10,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(
                            dashItems.length,
                            (index) => Container(
                              padding: EdgeInsets.all(15).r,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20).r,
                              ),
                              child: Column(
                                mainAxisAlignment: .spaceBetween,
                                crossAxisAlignment: .start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: dashItems[index].isAmount
                                          ? AssetConstants.nairaSymbol
                                          : '',
                                      children: [
                                        TextSpan(
                                          text: dashItems[index].subTitle,
                                        ),
                                      ],
                                    ),
                                    style: AppTextStyle.headline1.copyWith(
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  Text(
                                    dashItems[index].title,
                                    style: AppTextStyle.bodyText4,
                                  ),
                                  Align(
                                    alignment: .centerRight,
                                    child: CircleAvatar(
                                      radius: 10.h,
                                      backgroundColor: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                          child: Text(
                            'Recent Orders',
                            style: AppTextStyle.headline3.copyWith(
                              fontWeight: AppFontWeight.semiBold,
                            ),
                          ),
                        ),

                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(
                            orderList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ).r,
                              child: OrderWidget(model: orderList[index]),
                            ),
                          ),
                        ),
                        40.spacingH,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
