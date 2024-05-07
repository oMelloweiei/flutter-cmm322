import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/material.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              TextFormField(
                  controller: controller.verifyEmail,
                  expands: false,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      hintText: 'E-mail address',
                      filled: true,
                      fillColor: Ticolor.greenMaininput,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ))),
              SizedBox(height: 20),
              TextFormField(
                  controller: controller.verifyPhone,
                  expands: false,
                  validator: (value) => Validator.validateMobile(value),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      hintText: 'Phone number',
                      filled: true,
                      fillColor: Ticolor.greenMaininput,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ))),
            ],
          )),
    );
  }
}
