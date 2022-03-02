import 'package:http/http.dart' as http;
import 'package:laundry_app/models/order.dart';
import 'package:laundry_app/utils/constants.dart';

class OrderService {
  static Future<Order> getOrder() async {
    try {
      final Uri url = Uri.parse(Constants.apiEndpoint + "order/1");
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final response = await http.get(url, headers: headers);

      if (200 == response.statusCode) {
        final Order order = orderFromJson(response.body);
        return order;
      }
    } catch (e) {
      print("Error in service");
      print(e);
    }
  }
}
