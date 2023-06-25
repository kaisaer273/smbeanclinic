import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/order.dart';
import '../../../data/models/product.dart';

class CartController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxMap<dynamic, dynamic> _cartProduct = <dynamic, dynamic>{}.obs;
  final RxList<Order> _listOrdered = <Order>[].obs;
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(
      child: Text(
        "Đơn mới",
        style: Get.theme.textTheme.displaySmall,
      ),
    ),
    Tab(
      child: Text(
        "Lịch sử",
        style: Get.theme.textTheme.displaySmall,
      ),
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void addToCart(Product product) {
    if (!_cartProduct.containsKey(product)) {
      _cartProduct[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    _cartProduct.remove(product);
  }

  void increaseItem(Product product) {
    _cartProduct[product] += 1;
  }

  void decreaseItem(Product product) {
    if (_cartProduct[product] == 1) {
      removeFromCart(product);
    } else {
      _cartProduct[product] -= 1;
    }
  }

  int productValue(Product product) => _cartProduct[product];
  int calculatePricePerEachItem(Product product) {
    int price = 0;
    price = productValue(product) * product.salePrice!;
    return price;
  }

  get listOrdered => _listOrdered;
  get cartProduct => _cartProduct;
  get totalPrice => (_cartProduct.isNotEmpty)
      ? _cartProduct.entries
          .map((e) => e.key.salePrice! * e.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;
}
