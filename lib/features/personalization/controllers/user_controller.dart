import 'package:binny_application/data/models/user/userModel.dart';
import 'package:binny_application/data/repositories/user/user_repository.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert name to first and last
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid,
          username: username,
          firstname: nameParts[0],
          lastname: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          number: userCredentials.user!.phoneNumber ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your infomation. You can re-save your data in your Profile');
    }
  }
}
