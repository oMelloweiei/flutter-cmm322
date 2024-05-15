import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/data/repositories/shop_repository.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static ShopController get instance => Get.find();

  final shopRepository = Get.put(ShopRepository());

  final isLoading = false.obs;
  RxList<ShopModel> allShop = <ShopModel>[].obs;
  final storage = FirebaseStorage.instance;
  late String imageUrl;

  @override
  void onInit() {
    fetchShops();
    imageUrl = '';
    super.onInit();
  }

  //Load Topic data
  Future<void> fetchShops() async {
    try {
      isLoading.value = true;

      final shops = await shopRepository.getAllShops();

      allShop.assignAll(shops);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> getImageUrl(String imgName) async {
    try {
      final ref = storage.ref().child('Shop/img/shop/$imgName');
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw e.toString();
    }
  }
}
