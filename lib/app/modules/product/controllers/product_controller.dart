import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product.dart';
import '../../storage/controllers/storage_controller.dart';

class ProductController extends GetxController {
  StorageController storageController = Get.put(StorageController());
  RxList<Product> filteredProducts = <Product>[].obs;
  TextEditingController textEditingController = TextEditingController();
  RxString searchQuery = ''.obs;
  // RxList<ProductCategory> categories = AppData.categories.obs;
  // RxList<Product> filteredProducts = AppData.productItems.obs;
  @override
  void onInit() {
    getProductDataFromStorage();
    textEditingController.text = searchQuery.value;
    super.onInit();
    debounce(searchQuery, (value) => filterproduct(),
        time: const Duration(milliseconds: 300));
  }

  void getProductDataFromStorage() {
    filteredProducts.value = storageController.data.value;
  }

  void filterproduct() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredProducts.value = storageController.data.value;
    } else {
      filteredProducts.value = storageController.data.where((Product item) {
        return item.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  // filterItemByCategory(ProductCategory category) {
  //   for (var element in AppData.categories) {
  //     element.isSelected = false;
  //   }
  //   category.isSelected = true;

  //   if (category.type == ProductType.khangsinh) {
  //     filteredProducts.assignAll(AppData.productItems.obs);
  //   } else {
  //     filteredProducts.assignAll(AppData.productItems.where((item) {
  //       return item.type == category.type;
  //     }).toList());
  //   }
  // }
}
