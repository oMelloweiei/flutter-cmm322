import 'package:binny_application/data/repositories/user/user_repository.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/network_manager.dart';
import 'package:binny_application/pages/profile.dart';
import 'package:binny_application/utils/popups/full_screen_loader.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUserController extends GetxController {
  static UpdateUserController get instace => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final number = TextEditingController();
  final address = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  //Fetch user Record
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
    // email.text = userController.user.value.email;
    // number.text = userController.user.value.number;
    address.text = userController.user.value.address!;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are updating your infomation', 'assets/lottie/loading.json');

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Update user's info in the Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
        // 'Number': number.text.trim(),
        // 'Email': email.text.trim(),
        'Address': address.text.trim()
      };

      await userRepository.updateSingleField(name);

      //Update the Rx value User value
      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();
      // userController.user.value.number = number.text.trim();
      // userController.user.value.email = email.text.trim();
      userController.user.value.address = address.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Congratulations', message: 'Your account have been updated');

      Get.off(() => const profilePage());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
