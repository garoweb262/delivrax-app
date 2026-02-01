import '../../../../core/packages.dart';
import '../../../orders/presentation/widget/order_widget.dart';
import '../../model/order_model.dart';
import '../../repository/order_repository.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<OrderScreen> {
  List<String> dashItems = [
    "ALL",
    "ACTIVE",
    'PENDING',
    'COMPLETED',
    'CANCELLED',
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

  String activeTab = '';
  @override
  void initState() {
    activeTab = dashItems.first;
    super.initState();
  }

  changeTab(String value) {
    activeTab = value;
    setState(() {});
  }

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
                                'My Orders',
                                style: AppTextStyle.headline1.copyWith(
                                  color: AppColors.white,
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                              ),
                              // Text(
                              //   'Today • Dec 12, 2025',
                              //   style: AppTextStyle.bodyText4.copyWith(
                              //     color: AppColors.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // Icon(
                        //   Icons.notifications_none_outlined,
                        //   color: AppColors.whitepurple,
                        // ),
                        // 10.spacingW,
                        // CircleAvatar(
                        //   backgroundImage: AssetImage(
                        //     'assets/images/avater.png',
                        //   ),
                        //   backgroundColor: AppColors.white,
                        // ),
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
                    10.spacingH,
                    SizedBox(
                      width: double.infinity,
                      height: 35.h,
                      child: ListView.builder(
                        itemCount: dashItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            changeTab(dashItems[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10).r,
                            padding: EdgeInsets.symmetric(horizontal: 20).r,
                            decoration: BoxDecoration(
                              gradient: activeTab == dashItems[index]
                                  ? LinearGradient(
                                      colors: [
                                        AppColors.primaryDark,
                                        AppColors.primary,
                                      ],
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(30).r,
                              color: activeTab != dashItems[index]
                                  ? AppColors.white.withValues(alpha: 0.3)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                dashItems[index],
                                style: AppTextStyle.caption2.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
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
