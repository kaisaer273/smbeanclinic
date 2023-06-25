import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../product/controllers/product_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
