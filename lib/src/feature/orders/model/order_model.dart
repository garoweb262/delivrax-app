
import '../repository/order_repository.dart';

class OrderModel {
  String title;
  String subTitle;
  OrderStatus status;
  OrderModel({
    required this.title,
    required this.subTitle,
    required this.status,
  });
}
