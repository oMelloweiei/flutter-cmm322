import 'package:binny_application/features/authentication/controllers/signup/signup_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/button/google_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);

  final double _space = 20;

  final SignupController controller = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: controller.signupFormKey,
          child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4795DD),
                    Color(0xFF4DC5DD),
                    Color(0xFF52D3DB),
                    Color(0xFF3AB589),
                    Color(0xFF42BD6C),
                    Color(0xFF5AD255),
                  ],
                ),
              ),
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
                              validator: (value) => Validator.validateEmptyText(
                                  'First name', value),
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
                              validator: (value) => Validator.validateEmptyText(
                                  'Last name', value),
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
                      controller: controller.username,
                      expands: false,
                      validator: (value) =>
                          Validator.validateEmptyText('Username', value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          hintText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ))),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
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
                  TextFormField(
                      controller: controller.number,
                      expands: false,
                      validator: (value) => Validator.validateMobile(value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          hintText: 'Phone number',
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
                          prefixIcon:
                              Icon(Icons.key_rounded, color: Colors.grey),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
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
                          prefixIcon:
                              Icon(Icons.key_rounded, color: Colors.grey),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
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
                        backgroundColor: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => controller.signup(),
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: _space,
                  ),
                  Center(
                      child: Text(
                    'or continue with',
                    style: TextStyle(color: Colors.white),
                  )),
                  SizedBox(
                    height: _space,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: googleBTN(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account!',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          )),
                          onPressed: () => Get.toNamed('/login'),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              )),
        )));
  }
}
