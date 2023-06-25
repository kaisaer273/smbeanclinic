import 'package:get/get.dart';

import '../../../core/app_data.dart';

import '../../../data/models/product.dart';
import '../../../data/models/product_category.dart';

class ProductController extends GetxController {
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxList<Product> filteredProducts = AppData.productItems.obs;

  void filterproduct(String query) {
    filteredProducts.value = AppData.productItems.where((item) {
      return item.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  filterItemByCategory(ProductCategory category) {
    for (var element in AppData.categories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == ProductType.khangsinh) {
      filteredProducts.assignAll(AppData.productItems.obs);
    } else {
      filteredProducts.assignAll(AppData.productItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
  }
}
