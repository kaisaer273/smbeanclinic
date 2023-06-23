import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/customer/bindings/customer_binding.dart';
import '../modules/customer/views/customer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/statistical/bindings/statistical_binding.dart';
import '../modules/statistical/views/statistical_view.dart';
import '../modules/storage/bindings/storage_binding.dart';
import '../modules/storage/views/storage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 1000),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 1000),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => const CustomerView(),
      binding: CustomerBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 1000),
    ),
    GetPage(
      name: _Paths.STORAGE,
      page: () => const StorageView(),
      binding: StorageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 1000),
    ),
    GetPage(
      name: _Paths.STATISTICAL,
      page: () => const StatisticalView(),
      binding: StatisticalBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 1000),
    ),
  ];
}
