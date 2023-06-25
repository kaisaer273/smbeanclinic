import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smbeanclinic/app/modules/cart/controllers/cart_controller.dart';

import '../../../../global_widget/empty_widget.dart';
import '../../../product/controllers/product_controller.dart';

class HistoryOrderTab extends GetView<CartController> {
  const HistoryOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          body: EmptyWidget(
            title: "Lịch sử đơn hàng trống",
            condition: controller.listOrdered.isNotEmpty,
            child: SingleChildScrollView(
              child: SizedBox(
                height: height - (height * 0.05 + 110),
                child: GetBuilder(
                  builder: (ProductController controller) =>
                      orderedListView(context),
                ),
              ),
            ),
          ),
        ));
  }

  orderedListView(BuildContext context) {}
}
