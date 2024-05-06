import 'package:binny_application/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:binny_application/features/authentication/screens/password_config/reset_password.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('forgotPassword title'),
            SizedBox(
              height: 10,
            ),
            Text('forgotPassword subtitle'),
            SizedBox(
              height: 20,
            ),

            //Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: Validator.validateEmail,
                decoration: const InputDecoration(
                    labelText: 'email',
                    prefixIcon: Icon(Icons.arrow_forward_ios_rounded)),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
