import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smbeanclinic/app/global_widget/page_transition.dart';
import 'package:smbeanclinic/app/modules/cart/views/cart_view.dart';
import 'package:smbeanclinic/app/modules/customer/views/customer_view.dart';
import 'package:smbeanclinic/app/modules/statistical/views/statistical_view.dart';
import 'package:smbeanclinic/app/modules/storage/views/storage_view.dart';

import '../../product/views/product_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<Widget> screen = [
    ProductView(),
    const StorageView(),
    const CartView(),
    const CustomerView(),
    const StatisticalView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => PageTransition(
            child: screen[controller.currentBottomNavItemIndex.value],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentBottomNavItemIndex.value,
            onTap: controller.switchBetweenBottomNavigationItems,
            selectedFontSize: 0,
            items: controller.bottomNavigationItems.map(
              (element) {
                return BottomNavigationBarItem(
                  icon: element.disableIcon,
                  label: element.label,
                  activeIcon: element.enableIcon,
                );
              },
            ).toList(),
          )),
    );
  }
}
