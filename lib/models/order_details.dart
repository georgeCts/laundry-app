import 'dart:convert';

class OrderDetail {
  final int id;
  final int quantity;
  final String description;
  final double total;

  OrderDetail({this.id, this.quantity, this.description, this.total});

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
      id: json["id"], quantity: json["quantity"], description: json["description"], total: json["total"].toDouble());
}
