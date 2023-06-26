import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:smbeanclinic/app/core/theme/app_color.dart';

import '../../../global_widget/empty_widget.dart';

import '../../product/controllers/product_controller.dart';
import '../controllers/storage_controller.dart';

// final ProductController controller = Get.put(ProductController());

class StorageView extends GetView<StorageController> {
  const StorageView({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Kho sản phẩm",
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
        onChanged: (value) => {},
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          contentPadding: EdgeInsets.all(20),
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
                      return const Center(
                        child: Text("data"),
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
