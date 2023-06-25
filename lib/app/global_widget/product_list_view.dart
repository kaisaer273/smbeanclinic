import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/app_extension.dart';
import '../core/theme/theme_services.dart';
import '../modules/cart/controllers/cart_controller.dart';
import '../core/theme/app_color.dart';
import '../core/theme/app_style.dart';
import '../data/models/product.dart';
import '../modules/product/controllers/product_controller.dart';

class ProductListView extends GetView<ProductController> {
  final List<Product> products;
  final CartController cartController;

  const ProductListView({
    Key? key,
    required this.products,
    required this.cartController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (_, index) {
        Product product = products[index];
        return GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     CustomPageRoute(child: ProductDetailScreen(product: product)),
          //   );
          // },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeServices().loadThemeFromBox()
                  ? DarkThemeColor.primaryLight
                  : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width: 50,
                      child: Image.network(
                          'https://png.pngtree.com/png-clipart/20230504/original/pngtree-medicine-flat-icon-png-image_9138002.png',
                          scale: 6),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.name!}dddddddddddddddddddddddddddddd",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          product.ingredient ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${product.salePrice} đ",
                          style:
                              h3Style.copyWith(color: LightThemeColor.accent),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => IconButton(
                        onPressed:
                            (cartController.cartProduct.containsKey(product))
                                ? () => cartController.removeFromCart(product)
                                : () => cartController.addToCart(product),
                        icon: (cartController.cartProduct.containsKey(product))
                            ? const Icon(
                                Icons.assignment_add,
                                color: LightThemeColor.accent,
                              )
                            : const Icon(Icons.assignment_add),
                      )),
                ],
              ).fadeAnimation(0.7),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 16));
      },
    );
  }
}
