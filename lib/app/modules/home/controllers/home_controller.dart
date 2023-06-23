import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/bottom_navigation_item.dart';

class HomeController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.article_outlined),
      const Icon(Icons.article),
      'Sản phẩm',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.warehouse_outlined),
      const Icon(Icons.warehouse),
      'Sản phẩm',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Đơn hàng',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Danh bạ',
    ),
    BottomNavigationItem(
      const Icon(Icons.bar_chart_outlined),
      const Icon(Icons.bar_chart),
      'Thống kê',
    )
  ];

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }
}
