import 'package:binny_application/features/authentication/controllers/signup/signup_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final double _space = 35;

  final SignupController controller = SignupController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Container(
          padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Let\'s get started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: _space),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: controller.firstname,
                          validator: (value) =>
                              Validator.validateEmptyText('First name', value),
                          expands: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              hintText: 'First Name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              )))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextFormField(
                          controller: controller.lastname,
                          validator: (value) =>
                              Validator.validateEmptyText('Last name', value),
                          expands: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              hintText: 'Last Name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ))))
                ],
              ),
              SizedBox(
                height: _space,
              ),
              TextFormField(
                  controller: controller.email,
                  expands: false,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      hintText: 'E-mail',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ))),
              SizedBox(
                height: _space,
              ),
              Obx(() => TextFormField(
                  validator: (value) => Validator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidepassword.value,
                  expands: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key_rounded, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidepassword.value =
                              !controller.hidepassword.value;
                        },
                        icon: controller.hidepassword.value
                            ? Icon(Icons.visibility, color: Colors.grey)
                            : Icon(Icons.visibility_off,
                                color: Color(0xff62BF26)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      )))),
              SizedBox(
                height: _space,
              ),
              Obx(() => TextFormField(
                  validator: (value) => Validator.validateConfirmpassword(
                      value, controller.password.text),
                  controller: controller.confirmpassword,
                  obscureText: controller.hideconfirmpassword.value,
                  expands: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key_rounded, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hideconfirmpassword.value =
                              !controller.hideconfirmpassword.value;
                        },
                        icon: controller.hideconfirmpassword.value
                            ? Icon(Icons.visibility, color: Colors.grey)
                            : Icon(Icons.visibility_off,
                                color: Color(0xff62BF26)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      hintText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      )))),
              SizedBox(
                height: _space,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => controller.signup(),
                  child: Text('Confirm'),
                ),
              )
            ],
          )),
    );
  }
}
