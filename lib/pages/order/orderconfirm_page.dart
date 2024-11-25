import 'package:flutter/material.dart';
import 'package:namdelivery/constants/app_assets.dart';
import 'package:namdelivery/constants/app_colors.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:namdelivery/pages/order/order_cancel.dart';
import '../../services/comFuncService.dart';
import '../../services/nam_food_api_service.dart';
import 'order_details.dart';
import 'package:another_stepper/another_stepper.dart';

class OrderConfirmPage extends StatefulWidget {
  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xFF7FB032),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Image.asset(AppAssets.shoopingbag_icon),
      ),
      title: StepperText(
        "Order Confirm",
        textStyle: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    ),
    StepperData(
        title: StepperText(
          "Order Preparing",
          textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xFF7FB032),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Image.asset(AppAssets.order_preparing_icon),
        )),
    StepperData(
        title: StepperText(
          "Ready to Delivery",
          textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Image.asset(
            AppAssets.ready_todelivery_icon,
            color: Colors.white,
          ),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            toolbarHeight: 85,
            // title:
            flexibleSpace: Stack(children: [
              Positioned(
                  bottom: 1,
                  left: 40,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderCancel(),
                          ),
                        );
                      },
                      child: Container(
                          height: 40,
                          width: 120,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 217, 216, 216),
                              width: 0.8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                          ),
                          child: Row(children: [
                            IconButton(
                              icon: Icon(Icons.close, color: AppColors.red),
                              onPressed: () {},
                            ),
                            Text("Reject",
                                style: TextStyle(
                                    color: AppColors.red, fontSize: 16))
                          ]))))
            ])),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 216, 216),
                      width: 0.8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Order ID",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  " #123456789",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              "2.5km   10mins",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                              ),
                                            )
                                          ]),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 8),
                                        child: Text(
                                          "₹60",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "Preparation time : ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "10mins",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ])),
                ),
                SizedBox(height: 16),

                Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 217, 216, 216),
                        width: 0.8,
                      ),
                    ),
                    child: AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.horizontal,
                      iconWidth: 40,
                      iconHeight: 40,
                      activeBarColor: Color(0xFF7FB032),
                      inActiveBarColor: Colors.grey,
                      inverted: true,
                      verticalGap: 30,
                      activeIndex: 1,
                      barThickness: 4,
                    )),

                SizedBox(height: 16),
                // Pickup Details

                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 216, 216),
                      width: 0.8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Pickup Details
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Pickup Image
                            Column(
                              children: [
                                Image.asset(
                                  AppAssets.location_pickup_icon,
                                  height: 30,
                                  width: 30,
                                ),
                                // Dotted Line Between the Images
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Dash(
                                    direction: Axis.vertical,
                                    length: 80, // Adjust length for the spacing
                                    dashLength: 8,
                                    dashColor: Colors.grey,
                                  ),
                                ),
                                // Delivery Image
                                Image.asset(
                                  AppAssets.order_delivery_icon,
                                  height: 30,
                                  width: 30,
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            // Details Section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Pickup Information
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.red,
                                        width: 1.0,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      "Pickup",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Hotel Sangeetha's",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "No 37 Paranjothi Nagar Thylakoid, velour Nagar Trichy-620005",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Contact : 1234567890",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(height: 16),
                                  // Delivery Information
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.red,
                                        width: 1.0,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      "Delivery",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Hotel Sangeetha's",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "No 37 Paranjothi Nagar Thylakoid, velour Nagar Trichy-620005",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Contact : 1234567890",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(18.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetails(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Confirm Order",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )),
        ));
  }
}