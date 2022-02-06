import 'package:digitalconstruction/RegisterAsShopOwner.dart';
import 'package:digitalconstruction/Shop/ShopModel.dart';
import 'package:digitalconstruction/Shop/shopOwnerLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app/routes/app_pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Navigator.push(context, PageTransition(type:PageTransitionType.fade,child:SHOP()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //   fit: BoxFit.fill,
        //   image: AssetImage('assets/download.png'),
        // )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/download.png'),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Construction Pal",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MetroPolis',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Welcome to the Construction Pal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MetroPolis',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _scaleController.forward();
                        Get.offNamed(Routes.LOGIN);

                        setState(() {
                          hide = true;
                        });
                        _scaleController.forward();
                      },
                      child: AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: hide == false
                                    ? const Text(
                                        "Constructor",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'MetroPolis'),
                                      )
                                    : Container()),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.LoginWager);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            "Daily Wager",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MetroPolis',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.userLogin);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            "Customer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MetroPolis',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                    ///////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 10),

                    InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushNamed(RegisterAsShopOwner.routeName);
                        Get.toNamed(ShopOwnerLogin.routeName);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            "Shop Owner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MetroPolis',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
