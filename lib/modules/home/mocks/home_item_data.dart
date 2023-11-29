import 'package:quitanda/modules/cart/models/cart_models.dart';
import 'package:quitanda/modules/home/models/home_model.dart';
import 'package:quitanda/modules/orders/models/orders_model.dart';
import 'package:quitanda/modules/profile/models/profile_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/images/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/images/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/images/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/images/kiwi2.jpg',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/images/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/images/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<CartModel> cartItems = [
  CartModel(
    id: "1",
    itemModel: apple,
    quantity: 3,
  ),
  CartModel(
    id: "1",
    itemModel: mango,
    quantity: 1,
  ),
  CartModel(
    id: "1",
    itemModel: papaya,
    quantity: 4,
  )
];

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];

ProfileModel user = ProfileModel(
    phone: "99 9999-9999",
    cpf: "99999999",
    name: "Henrique Dantas",
    email: "Henrique@Gmail.com",
    password: "");

List<OrdersModel> orders = [
  // Pedido 01
  OrdersModel(
    copyAndPast: 'q1w2e3r4t5y6',
    createDatetime: DateTime.parse(
      '2024-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartModel(
        id: "1",
        itemModel: apple,
        quantity: 2,
      ),
      CartModel(
        id: "1",
        itemModel: mango,
        quantity: 2,
      ),
    ],
  ),

  // Pedido 02
  OrdersModel(
    copyAndPast: 'q1w2e3r4t5y6',
    createDatetime: DateTime.parse(
      '2024-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-06-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartModel(
        id: "1",
        itemModel: guava,
        quantity: 1,
      ),
    ],
  ),
];
