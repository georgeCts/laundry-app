import 'dart:convert';
import 'package:laundry_app/models/order_details.dart';
import 'package:laundry_app/utils/helper.dart';

enum OrderStatus { PICKING_UP, DELIVERING }

Order orderFromJson(String str) {
  return Order.fromJson(json.decode(str));
}

class Order {
  int id;
  OrderStatus status;
  DateTime arrivalDate;
  DateTime placedDate;
  String deliveryAddress;
  List<OrderDetail> details;

  Order({
    this.id,
    this.status,
    this.arrivalDate,
    this.placedDate,
    this.deliveryAddress,
    this.details,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    OrderStatus status;

    if (json['status'] == "PICKING_UP") {
      status = OrderStatus.PICKING_UP;
    } else {
      status = OrderStatus.DELIVERING;
    }

    return Order(
        id: json['id'],
        status: status,
        arrivalDate: convertFromString(json['arrival']),
        placedDate: json['placed'] == null ? null : convertFromString(json['placed']),
        deliveryAddress: json['address'],
        details: List<OrderDetail>.from(json["details"].map((x) => OrderDetail.fromJson(x))));
  }
}
