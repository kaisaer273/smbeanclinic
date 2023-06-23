import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/app_data.dart';
import '../../../core/app_theme.dart';
import '../../../data/models/product.dart';
import '../../../data/models/product_category.dart';

class ProductController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  final RxMap<Product, dynamic> _cartProduct = <Product, int>{}.obs;
  RxList<Product> favoriteProduct = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxList<Product> filteredProducts = AppData.productItems.obs;

  Rx<ThemeData> theme = AppTheme.lightTheme.obs;
  bool isLightTheme = true;

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  void filterproduct(String query) {
    filteredProducts.value = AppData.productItems.where((item) {
      return item.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
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

  int calculatePricePerEachItem(Product product) {
    int price = 0;
    price = productValue(product) * product.salePrice!;
    return price;
  }

  int productValue(Product product) => _cartProduct[product].value;

  get cartProduct => _cartProduct;
  get totalPrice => (_cartProduct.isNotEmpty)
      ? _cartProduct.entries
          .map((e) => e.key.salePrice! * e.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;

  // calculateTotalPrice() {
  //   totalPrice.value = 5;
  //   for (var element in _cartProduct) {
  //     totalPrice.value += element.quantity * element.price;
  //   }

  //   subtotalPrice.value = 0;
  //   if (totalPrice.value > 0) {
  //     subtotalPrice.value = totalPrice.value - 5;
  //   }
  // }

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

  // isFavoriteProduct(Product product) {
  //   product.isFavorite = !product.isFavorite;
  //   update();
  //   if (product.isFavorite) {
  //     favoriteProduct.add(product);
  //   }
  //   if (!product.isFavorite) {
  //     favoriteProduct.removeWhere((element) => element == product);
  //   }
  // }

  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }
}
