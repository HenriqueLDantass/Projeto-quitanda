import 'package:get/get.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/home/mocks/home_item_data.dart';
import 'package:quitanda/modules/home/models/category_models.dart';
import 'package:quitanda/modules/home/models/home_model.dart';
import 'package:quitanda/modules/home/repository/home_repository.dart';
import 'package:quitanda/modules/home/result/home_result.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final HomeRepositoty homeRepositoty = HomeRepositoty();
  List<CategoryModel> listCategories = [];
  final UtilsServices utilsServices = UtilsServices();
  CategoryModel? currentCategory;
  bool isCategoryloading = false;
  bool isProductLoading = true;

  RxString searchTitle = ''.obs;

  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  bool get isLastPage {
    if (currentCategory!.items.length < itemsPerPage) return true;
    return currentCategory!.pagination * itemsPerPage > allProducts.length;
  }

  @override
  void onInit() {
    super.onInit();

//definindo um tempo para efetuar a requisição
    debounce(searchTitle, (_) => filterByTitle(),
        time: const Duration(
          milliseconds: 600,
        ));

    getAllCategories();
  }

  setloagind(bool value, {bool isProduct = false}) {
    if (!isProductLoading) {
      isProductLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
    // if (currentCategory!.items.isEmpty) return;
    getProducts();
  }

  Future<void> getAllCategories() async {
    setloagind(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepositoty.getAllCategories();
    setloagind(false);

    homeResult.when(
      sucess: (data) {
        listCategories.assignAll(data);
        if (listCategories.isEmpty) return;
        selectCategory(listCategories.first);
      },
      error: (error) {
        utilsServices.messageToast(
          isError: true,
          message: error,
        );
      },
    );
  }

  Future<void> getProducts({bool canLoad = true}) async {
    if (canLoad) {
      setloagind(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemsPerPage
    };

    if (searchTitle.value.isNotEmpty) {
      body['title'] = searchTitle.value;

      if (currentCategory!.id == '') {
        body.remove('categoryId');
      }
    }

    HomeResult<ItemModel> result = await homeRepositoty.getAllProducts(body);
    setloagind(false, isProduct: false);

    result.when(sucess: (data) {
      currentCategory?.items.addAll(data);
    }, error: (message) {
      return utilsServices.messageToast(message: message, isError: true);
    });
  }

  void loadMoreProducts() {
    currentCategory!.pagination++;
    getProducts(canLoad: false);
  }

  void filterByTitle() {
    for (var category in listCategories) {
      category.items.clear();
      category.pagination = 0;
    }

    if (searchTitle.value.isEmpty) {
      listCategories.removeAt(0);
    } else {
      CategoryModel? c = listCategories.firstWhereOrNull((cat) => cat.id == '');

      if (c == null) {
        final allProdutcsCategories = CategoryModel(
          title: "Todos",
          id: '',
          pagination: 0,
          items: [],
        );
        listCategories.insert(0, allProdutcsCategories);
      } else {
        c.items.clear();
        c.pagination = 0;
      }
    }
    currentCategory = listCategories.first;
    update();
    getProducts();
  }
}
