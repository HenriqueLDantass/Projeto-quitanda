import 'dart:ffi';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:quitanda/core/routes/app_routes.dart';
import 'package:quitanda/modules/base/controller/navigation_controller.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';
import 'package:quitanda/modules/home/controller/home_controller.dart';
import 'package:quitanda/modules/home/widgets/categories_tile.dart';
import 'package:quitanda/modules/home/mocks/home_item_data.dart' as itemData;
import 'package:quitanda/modules/home/widgets/items_card.dart';
import 'package:quitanda/modules/home/widgets/shimmer_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigatorController = Get.find<NavigatorController>();
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedAnimation(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 20.0),
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      navigatorController.navigatePageView(
                          page: NavigatorName.cart);
                    },
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -15, end: -12),
                      badgeContent: GetBuilder<CartController>(
                        builder: (controller) {
                          return Text(
                            controller.cartItems.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      child: AddToCartIcon(
                        key: cartKey,
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quitanda",
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              Text(
                "Online",
                style: TextStyle(color: Colors.green, fontSize: 32),
              )
            ],
          )),
      body: AddToCartAnimation(
        gkCart: cartKey,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCartAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            //pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return TextFormField(
                    onChanged: (value) {
                      controller.searchTitle.value = value;
                    },
                    controller: controllerSearch,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Pesquise aqui...",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: controller.searchTitle.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                controllerSearch.clear();
                                controller.searchTitle.value = "";
                                FocusScope.of(context).unfocus();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          )),
                    ),
                  );
                },
              ),
            ),

            //CATEGORIAS
            GetBuilder<HomeController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 40,
                  child: !controller.isCategoryloading
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listCategories.length,
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (_, index) {
                            return CategoriesTile(
                              isSelected: controller.listCategories[index] ==
                                  controller.currentCategory,
                              category: controller.listCategories[index].title,
                              onpressed: () {
                                controller.selectCategory(
                                    controller.listCategories[index]);
                              },
                            );
                          },
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            10,
                            (index) => Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 12),
                              child: CustomShimmer(
                                height: 20,
                                width: 80,
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            })
            //PRODUTOS
            ,
            GetBuilder<HomeController>(builder: (controller) {
              return Expanded(
                child: !controller.isProductLoading
                    ? Visibility(
                        visible: (controller.currentCategory?.items ?? [])
                            .isNotEmpty,
                        replacement: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text("Não foi encontrado esse item!")
                          ],
                        ),
                        child: GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.allProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 9 / 11.5),
                          itemBuilder: (context, index) {
                            if (((index + 1) ==
                                    controller.allProducts.length) &&
                                controller.isLastPage) {
                              controller.loadMoreProducts();
                            }
                            return ItemsCard(
                                item: controller.allProducts[index],
                                cartAnimationMethod: itemSelectedAnimation);
                          },
                        ),
                      )
                    : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                            10,
                            (index) => CustomShimmer(
                                  height: double.infinity,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(45),
                                )),
                      ),
              );
            })
          ],
        ),
      ),
    );
  }
}
