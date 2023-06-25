import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:smbeanclinic/app/modules/cart/views/widgets/history_order_tab.dart';
import 'package:smbeanclinic/app/modules/cart/views/widgets/new_order_tab.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quản lý đơn hàng",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        bottom: TabBar(
          tabs: controller.tabs,
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(controller: controller.tabController, children: const [
        NewOrderTab(),
        HistoryOrderTab(),
      ]),
    );
  }
}
