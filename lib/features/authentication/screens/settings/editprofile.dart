import 'package:binny_application/features/authentication/controllers/setting/edit_profile_controller.dart';
import 'package:binny_application/features/authentication/screens/settings/re_auth_user_login_form.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/circular_image.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserController());
    final user = UserController.instance;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height + 100,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(129, 218, 246, 1),
                        Colors.white,
                      ],
                      stops: [
                        0.0,
                        0.5
                      ]),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.16,
              left: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  TImages.bgprofile,
                ),
              ),
            ),
            // //ส่วนเเสดงคอนเทนเนอร์สีขาว โดยล็อคตำแหน่งเอาไว้
            Positioned(
              top: MediaQuery.of(context).size.height * 0.255,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดขอบมนขนาด 10 px
                  ),
                  child: Form(
                    key: controller.updateUserNameFormKey,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.018),
                            ElevatedButton(
                                onPressed: () =>
                                    user.uploadUserProfilePicture(),
                                child: Text('Add Photo (Optional)')),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                        controller: controller.firstName,
                                        validator: (value) =>
                                            Validator.validateEmptyText(
                                                'First name', value),
                                        expands: false,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 25),
                                            hintText: 'First Name',
                                            filled: true,
                                            fillColor: Ticolor.greenMaininput,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            )))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextFormField(
                                        controller: controller.lastName,
                                        validator: (value) =>
                                            Validator.validateEmptyText(
                                                'Last name', value),
                                        expands: false,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 25),
                                            hintText: 'Last Name',
                                            filled: true,
                                            fillColor: Ticolor.greenMaininput,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            )))),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // ReAuthLoginForm(),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines: 5,
                                maxLines: null,
                                controller: controller.address,
                                expands: false,
                                // validator: (value) =>
                                //     Validator.validate(value),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    hintText: 'Address',
                                    filled: true,
                                    fillColor: Ticolor.greenMaininput,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Ticolor.greenMain3,
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () => controller.updateUserName(),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  side: BorderSide(width: 2, color: Colors.red),
                                  backgroundColor: Colors.transparent,
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () =>
                                    Get.to(() => ReAuthLoginForm()),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Obx(() {
                    final networkImage = user.user.value.profilePicture;
                    final image = networkImage.isNotEmpty
                        ? networkImage
                        : TImages.profilerabbit;
                    return CircularImage(
                      image: image,
                      width: 120,
                      height: 120,
                      isNetWorkImage: networkImage.isNotEmpty,
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
