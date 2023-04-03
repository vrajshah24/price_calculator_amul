import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:price_calculator_amul/colors.dart';
import 'package:price_calculator_amul/database/local/models/ProductModel.dart';
import 'package:price_calculator_amul/database/local/services/ProductService.dart';
import 'package:price_calculator_amul/responsive.dart';

import '../database/local/models/GroupModel.dart';
import '../database/local/services/GroupService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> productList = [];
  List<GroupModel> groupList = [];

  List<Product> CartList = [];

  Color checkFavourite(int fav) {
    if (fav == 0) {
      return Colors.grey.shade200;
    } else {
      return primaryColor;
    }
  }

  getFavouriteList() async {
    productList = [];
    productList = await ProductDatabase.fetchFavourite();
    setState(() {});
  }

  addToFavourite(int id) async {
    await ProductDatabase.favourite(id);
  }

  getgroupList() async {
    groupList = [];
    groupList = await GroupDatabase.fetchAll();
  }

  getProductsbyGroup(int id) async {
    productList = [];
    productList = await ProductDatabase.fetchByGrpid(id);
    setState(() {});
  }

  getProducts() async {
    productList = [];
    productList = await ProductDatabase.fetchAll();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getgroupList();
    getProducts();
  }

  checkforProduct(int pid) {
    for (int i = 0; i < CartList.length; i++) {
      if (CartList[i].prd_id == pid) {
        return i;
      }
    }
  }

  int totalAmt = 0;
  int calculateAmount() {
    totalAmt = 0;
    if (CartList.isEmpty) {
      ProductDatabase.emptyCart();
      return 0;
    }
    for (int i = 0; i < CartList.length; i++) {
      totalAmt = totalAmt + CartList[i].quantity * CartList[i].rate;
    }
    return totalAmt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Price Calculator'),
      ),
      body: SingleChildScrollView(
        // height: getHeight(context),
        // width: getWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: 20 * getResponsive(context),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [Text('Name'), Text('Quantity')],
                  // ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      height: 0.3 * getHeight(context),
                      width: 0.9 * getWidth(context),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemCount: CartList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(CartList[index].prd_shortname),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            CartList[index].addQuantity = 1;
                                            calculateAmount();
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade100),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10 * getResponsive(context),
                                        ),
                                        Text(CartList[index]
                                            .quantity
                                            .toString()),
                                        SizedBox(
                                          width: 10 * getResponsive(context),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (CartList[index].getQuantity ==
                                                1) {
                                              CartList.remove(CartList[index]);
                                              calculateAmount();
                                            } else {
                                              CartList[index].minusQuantity = 1;
                                              calculateAmount();
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade100),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30 * getResponsive(context),
                                        ),
                                        Text(
                                          '₹${CartList[index].getQuantity * CartList[index].rate}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 10 * getResponsive(context),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                height: 20 * getResponsive(context),
                                color: Colors.grey.shade300,
                              )
                            ],
                          );
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20 * getResponsive(context),
            ),
            InkWell(
              onTap: () {
                CartList = [];
                calculateAmount();
                setState(() {});
              },
              child: Card(
                elevation: 5,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35 * getResponsive(context)),
                  height: 0.08 * getHeight(context),
                  width: 0.9 * getWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ટોટલ :',
                        style: TextStyle(
                            fontSize: 20 * getResponsiveText(context),
                            color: Colors.white),
                      ),
                      Text(
                        '  ₹ ${calculateAmount()}',
                        style: TextStyle(
                            fontSize: 18 * getResponsiveText(context),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20 * getResponsive(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await getFavouriteList();
                    setState(() {});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                          )
                        ],
                      )),
                    ),
                  ),
                ),
                Container(
                  height: 0.05 * getHeight(context),
                  width: 0.8 * getWidth(context),
                  child: ListView.builder(
                    itemCount: groupList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await getProductsbyGroup(
                              groupList[index].grp_id as int);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: Container(
                            // width: 0.2 * getWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15 * getResponsive(context),
                                vertical: 8 * getResponsive(context)),
                            child:
                                Center(child: Text(groupList[index].grp_name)),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20 * getResponsive(context),
            ),
            Container(
              height: 0.35 * getHeight(context),
              width: getWidth(context),
              child: GridView.builder(
                padding: EdgeInsets.only(left: 10 * getResponsive(context)),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () async {
                      await addToFavourite(productList[index].prd_id as int);
                      await Fluttertoast.showToast(
                          msg: 'Product Added to Favourites',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red);
                    },
                    // onTap: () {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20)),
                    //         content: SizedBox(
                    //           height: 0.1 * getHeight(context),
                    //           width: 0.5 * getWidth(context),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.favorite_border,
                    //                     color: Colors.yellow.shade700,
                    //                   ),
                    //                   SizedBox(
                    //                     width: 20 * getResponsive(context),
                    //                   ),
                    //                   Text(
                    //                     'Add to Favourites',
                    //                     style: TextStyle(
                    //                         color: Colors.yellow.shade700,
                    //                         fontSize: 10 *
                    //                             getResponsiveText(context)),
                    //                   )
                    //                 ],
                    //               ),
                    //               Divider(
                    //                 thickness: 2,
                    //                 height: 30 * getResponsive(context),
                    //                 color: Colors.grey.shade200,
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.add,
                    //                     color: primaryColor,
                    //                   ),
                    //                   SizedBox(
                    //                     width: 20 * getResponsive(context),
                    //                   ),
                    //                   InkWell(
                    //                     onTap: () {
                    //                       setState(() {
                    //                         // List product = ['Amul Gold', 28.00];
                    //                         // productList.add(product);
                    //                       });
                    //                       Navigator.pop(context);
                    //                     },
                    //                     child: Text(
                    //                       'Add Product',
                    //                       style: TextStyle(
                    //                           color: primaryColor,
                    //                           fontSize: 10 *
                    //                               getResponsiveText(context)),
                    //                     ),
                    //                   )
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   );
                    // },
                    onTap: () async {
                      var res =
                          checkforProduct(productList[index].prd_id as int);
                      if (res != null) {
                        CartList[res].addQuantity = 1;
                      } else {
                        CartList.add(productList[index]);
                      }
                      calculateAmount();
                      setState(() {});
                    },
                    child: Card(
                        elevation: 3,
                        shadowColor:
                            checkFavourite(productList[index].isFavourite),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  productList[index].prd_image,
                                  height: 100 * getResponsive(context),
                                ),
                                Center(
                                    child: Text(
                                  productList[index].prd_shortname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ))
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10 * getResponsive(context),
                                        vertical: 5 * getResponsive(context)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: primaryColor),
                                    child: Text(
                                      productList[index].rate.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
