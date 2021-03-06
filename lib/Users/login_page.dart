import 'package:auto_size_text/auto_size_text.dart';
import 'package:digitalconstruction/app/constants/app_constants.dart';
import 'package:digitalconstruction/app/modules/login/views/ForgetPassword.dart';
import 'package:digitalconstruction/app/routes/app_pages.dart';
import 'package:digitalconstruction/app/widgets/custom_button.dart';
import 'package:digitalconstruction/app/widgets/custom_text_field.dart';
import 'package:digitalconstruction/app/widgets/responsive_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'UserLoginController.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? email, pass;

  final UserLoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
      mobileBody: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Image(
                  image: AssetImage(klogo),
                  width: width * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const AutoSizeText(
                  'Login as a Customer',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MetroPolis',
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.passwordController,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotScreen()));
                        },
                        child: const Text(
                          "Forgot password ?",
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                  width: width * 0.3,
                  height: height * 0.05,
                  text: 'Login',
                  onPressed: () async {
                    Get.dialog(
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    if (!controller.validateForm()) {
                      Get.back();

                      Get.snackbar(
                        'Error',
                        'Provide the credentials',
                        colorText: kPinkColor,
                      );
                    } else {
                      await controller.login();
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: const AutoSizeText(
                    'Register as a Customer',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: const AutoSizeText(
                    'Login as a constructor',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LoginWager);
                  },
                  child: const AutoSizeText(
                    'Login as a Wager',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
