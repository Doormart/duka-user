import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';

class VendorProduct {
  final Product product;
  final Vendor vendor;

  VendorProduct({
    required this.vendor,
    required this.product,
  });
}
