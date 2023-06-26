import 'package:get/get.dart';

import '../../../core/app_data.dart';
import '../../../data/models/product.dart';
import '../../../data/models/product_category.dart';

class StorageController extends GetxController {
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxList<Product> filteredProducts = <Product>[].obs;
  final RxList<Product> _data = <Product>[].obs;

  @override
  void onInit() {
    fetchData();
    getData();
    super.onInit();
  }

  void fetchData() {
    _data.value = AppData.productItems;
  }

  get data => _data;

  void getData() {
    filteredProducts.value = data;
  }
}
