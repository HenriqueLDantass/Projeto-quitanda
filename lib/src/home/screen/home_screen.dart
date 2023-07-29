import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:quitanda/src/home/widgets/categories_tile.dart';
import 'package:quitanda/src/home/mocks/home_item_data.dart' as itemData;
import 'package:quitanda/src/home/widgets/items_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -15, end: -12),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.green,
                  ),
                ),
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
      body: Column(
        children: [
//pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: "Pesquise aqui...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                      width: 0,
                    )),
              ),
            ),
          ),
//categorias
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: itemData.categories.length,
                separatorBuilder: (_, index) => const SizedBox(
                  width: 12,
                ),
                itemBuilder: (_, index) {
                  return CategoriesTile(
                    isSelected: itemData.categories[index] == selectedCategory,
                    category: itemData.categories[index],
                    onpressed: () {
                      setState(() {
                        selectedCategory = itemData.categories[index];
                      });
                    },
                  );
                },
              ),
            ),
          )
//items
          ,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              itemCount: itemData.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 11.5),
              itemBuilder: (context, index) {
                return ItemsCard(
                  item: itemData.items[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
