import 'package:binny_application/features/authentication/controllers/login/login_controller.dart';
import 'package:binny_application/features/authentication/screens/password_config/forgot_password.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/button/google_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: controller.loginFormKey,
          child: Container(
              height: MediaQuery.of(context).size.height,
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      'Hey, Welcome Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Email
                  TextFormField(
                      controller: controller.email,
                      validator: (value) => Validator.validateEmail(value),
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          hintText: 'Enter your e-mail',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ))),
                  SizedBox(height: 30),
                  //Password
                  Obx(() => TextFormField(
                      controller: controller.password,
                      validator: (value) => Validator.validatePassword(value),
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
                          hintText: 'Enter your password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          )))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color(0xff62BF26),
                              side: BorderSide(color: Colors.white),
                              value: controller.rememberMe.value,
                              onChanged: (value) => controller.rememberMe
                                  .value = !controller.rememberMe.value)),
                          Text(
                            'Remember Me',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () => Get.to(() => const ForgotPassword()),
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          )),
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  //Sign in Button
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => controller.emailAndPasswordSignIn(),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    'or continue with',
                    style: TextStyle(color: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: googleBTN(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Don\' have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          )),
                          onPressed: () => Get.toNamed('/signup'),
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              )),
        )));
  }
}
