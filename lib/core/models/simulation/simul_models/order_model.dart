import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';

class Order {

  final String id, address;
  final DateTime deliveryDeparture, deliveryArrival;
  final int total, quantity;
  final Vendor vendor;
  final Product product;
  final double? rating;

  Order({
    required this.id,
    required this.deliveryDeparture,
    required this.deliveryArrival,
    required this.address,
    required this.total,
    required this.quantity,
    required this.vendor,
    required this.product,
    this.rating,
  });

}