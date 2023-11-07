import 'package:flutter/material.dart';
import 'package:quitanda/modules/cart/pages/cart_screen.dart';
import 'package:quitanda/modules/home/pages/home_screen.dart';
import 'package:quitanda/modules/orders/pages/orders_screen.dart';
import 'package:quitanda/modules/profile/pages/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeScreen(),
          CartScreen(),
          OrdersScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
            // pageController.animateToPage(
            //   index,
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.ease,
            // );
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white.withAlpha(70),
        backgroundColor: Colors.green,
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
