import 'package:auto_size_text/auto_size_text.dart';
import 'package:digitalconstruction/app/constants/app_constants.dart';
import 'package:digitalconstruction/app/modules/login/views/ForgetPassword.dart';
import 'package:digitalconstruction/app/routes/app_pages.dart';
import 'package:digitalconstruction/app/widgets/custom_button.dart';
import 'package:digitalconstruction/app/widgets/custom_text_field.dart';
import 'package:digitalconstruction/app/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'WagerLoginController.dart';
import 'add_daily_wagers.dart';

class LoginWager extends GetView<WagerLoginController> {
  final WagerLoginController controller = Get.find();

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
                  'Login as a Wager',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MetroPolis',                    fontSize: 24,
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
                    padding: EdgeInsets.only(right: 20),
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
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )),
                SizedBox(
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
                      Center(
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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AddWager()));
                  },
                  child: AutoSizeText(
                    'Register as a Wager',
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
                    Get.offNamed(Routes.userLogin);
                  },
                  child: AutoSizeText(
                    'Login as a Customer',
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
                    Get.offNamed(Routes.LOGIN);
                  },
                  child: AutoSizeText(
                    'Login as a constructor',
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
