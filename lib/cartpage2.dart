import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/cartController.dart';

class CartPage2 extends StatefulWidget {
  @override
  State<CartPage2> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage2> {
  final CartController cartController = Get.find<CartController>();

  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;

  // Find the controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: const Text(
                    'Selected Items',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          backgroundColor: Color(0xff829356),
        ),
      ),
      body: Column(
        children: [
          /// Selected Items List
          Container(
            height: h * 0.70,
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.selectedItems.length,
                itemBuilder: (context, index) {
                  var item = cartController.selectedItems[index];
                  return Column(
                    children: [
                      Container(
                        // height: h*0.83,
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
                              elevation: 5.0,
                              child: Container(
                                width: w * 0.2,
                                height: w * 0.2,
                                child: Container(
                                  padding: EdgeInsets.all(w * 0.015),
                                  child: Image.asset(
                                    (item['image']),
                                  ),
                                ),
                              ),
                            ),

                            /// Product Name and Price
                            Container(
                              width: w * 0.35,
                              margin:
                                  EdgeInsets.only(left: w * 0.02, right: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (item['name']),
                                    style: const TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(('\$${item['price']}'),
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
                                cartController.removeItem(item['name']);
                              },

                              style: ElevatedButton.styleFrom(
                                elevation: 6.0,
                                backgroundColor: Color(0xff829356),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Icon(
                                Icons.remove_shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  /// another way to show items under ListView.Builder
                  //   ListTile(
                  //   leading: Image.asset(item['image']),
                  //   title: Text(item['name']),
                  //   subtitle: Text('\$${item['price']}'),
                  //   trailing: ElevatedButton(
                  //     onPressed: (){cartController.removeItem(item['name']);},
                  //     child:Icon(Icons.remove_shopping_cart,
                  //     color: Colors.white,),
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.teal,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //     ),
                  //     ),
                  // );
                },
              );
            }),
          ),
          Container(
            height: h * 0.15,
            width: w * 100,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() {
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Total Amount: \$${cartController.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 6.0,
                      backgroundColor: Color(0xff829356),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
