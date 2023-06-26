import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smbeanclinic/app/core/theme/app_color.dart';
import 'package:smbeanclinic/app/core/theme/theme_services.dart';
import 'package:smbeanclinic/app/modules/cart/controllers/cart_controller.dart';

import '../../../global_widget/empty_widget.dart';
import '../../../global_widget/product_list_view.dart';
import '../controllers/product_controller.dart';

// final ProductController controller = Get.put(ProductController());

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () => ThemeServices().switchTheme(),
      ),
      title: Text(
        "Danh sách sản phẩm",
        style: Theme.of(context).textTheme.displaySmall,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.qr_code_scanner_outlined,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: TextField(
        controller: controller.textEditingController,
        onChanged: (value) => controller.searchQuery.value = value,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: IconButton(
              onPressed: () {
                controller.searchQuery.value = '';
                controller.textEditingController.text = '';
              },
              icon: const Icon(Icons.close)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const Divider(
              thickness: 2,
              color: LightThemeColor.accent,
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: EmptyWidget(
                  title: "Không có sản phẩm",
                  condition: controller.filteredProducts.isNotEmpty,
                  child: GetBuilder(
                    builder: (ProductController controller) {
                      return ProductListView(
                        cartController: cartController,
                        products: controller.filteredProducts,
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
