import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: controller.verifyEmail,
                      expands: false,
                      validator: (value) => Validator.validateEmail(value),
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          hintText: 'E-mail address',
                          filled: true,
                          fillColor: Ticolor.greenMaininput,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ))),
                  SizedBox(height: 20),
                  Obx(() => TextFormField(
                      validator: (value) => Validator.validatePassword(value),
                      controller: controller.verifyPassword,
                      obscureText: controller.hidePassword.value,
                      expands: false,
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.key_rounded, color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value =
                                  !controller.hidePassword.value;
                            },
                            icon: controller.hidePassword.value
                                ? Icon(Icons.visibility, color: Colors.grey)
                                : Icon(Icons.visibility_off,
                                    color: Color(0xff62BF26)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          hintText: 'Password',
                          filled: true,
                          fillColor: Ticolor.greenMaininput,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )))),
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
                      onPressed: () =>
                          controller.reAuthenticationEmailAndPassword(),
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
                ],
              ))),
    );
  }
}
