import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/cartController.dart';
import 'package:shoppingcart/cartpage2.dart';

class Cartpage1 extends StatelessWidget {
  const Cartpage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShoppingPage1STF();
  }
}

class ShoppingPage1STF extends StatefulWidget {
  const ShoppingPage1STF({Key? key}) : super(key: key);

  @override
  State<ShoppingPage1STF> createState() => _ShoppingPage1STFState();
}

class _ShoppingPage1STFState extends State<ShoppingPage1STF> {
  final CartController cartController =
      Get.put(CartController()); // Initialize the controller

  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;

  List<String> productName = [
    'Cleanser',
    'Moisturiser',
    'Face Wash',
    'Hair Serum',
    'Toner',
    'Hand Cream',
    'Body Wash',
    'Vitamin-C Seerum',
  ];

  List<String> productPrice = [
    '200',
    '100',
    '150',
    '300',
    '50',
    '100',
    '150',
    '300',
  ];

  List<String> productImage = [
    'assets/images/cleanser.png',
    'assets/images/moisturizerr.png',
    'assets/images/face_wash.png',
    'assets/images/hair_seerum.png',
    'assets/images/toner1.png',
    'assets/images/hand_caream.png',
    'assets/images/body_wash.png',
    'assets/images/v_c.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Color(0xff829356),
          title: Container(
            // margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 70.0, top: 20.0),
                  child: const Text(
                    'Product List',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Obx(() => Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => CartPage2());
                            },
                            child: Container(
                              width: w * 0.11,
                              height: w * 0.11,
                              child: Card(
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Color(0xff829356),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: w * 0.07),
                            width: w * 0.045,
                            height: w * 0.045,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                cartController.cartCount.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          /// Cart Items
          Container(
            height: h * 0.83,
            width: w,
            margin: EdgeInsets.only(top: h * 0.01),
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.only(left: w * 0.05, top: h * 0.03),
                  child: Row(
                    children: [
                      /// Image
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80.0),
                              bottomLeft: Radius.circular(8.0)),
                        ),
                        color: Color(0xff829356),
                        elevation: 6.0,
                        // surfaceTintColor: Colors.blue,
                        child: Container(
                          // color: Color(0xff829356),
                          width: w * 0.2,
                          height: w * 0.2,
                          child: Container(
                            padding: EdgeInsets.all(w * 0.015),
                            child: Image.asset(
                              width: 25.0,
                              productImage[index],
                            ),
                          ),
                        ),
                      ),

                      /// Product Name and Price
                      Container(
                        width: w * 0.35,
                        margin: EdgeInsets.only(left: w * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName[index],
                              style: const TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                              child: Text('small/large'),
                            ),
                            Text('\$' + productPrice[index],
                                style: const TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cartController.addItem(
                            productName[index],
                            productPrice[index],
                            productImage[index],
                          );
                        },

                        style: ElevatedButton.styleFrom(
                            elevation: 6.0,
                            backgroundColor: Color(0xff829356),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
