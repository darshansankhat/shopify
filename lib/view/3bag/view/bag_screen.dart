import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //search
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //bag
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "My Bag",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
              //item
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 310.sp,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 75.sp,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            //image
                            Container(
                              height: 72.sp,
                              width: 90.sp,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  color: Colors.amber),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //name
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  // SizedBox(
                                  //   width: 60.w,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //
                                  //       PopupMenuButton(
                                  //         itemBuilder: (context) {
                                  //           return [
                                  //             PopupMenuItem(
                                  //               child: Text(
                                  //                 "Add to favorite",
                                  //                 style:
                                  //                     TextStyle(fontSize: 16),
                                  //               ),
                                  //             ),
                                  //             PopupMenuItem(
                                  //               child: Text(
                                  //                   "Delete from the list"),
                                  //             ),
                                  //           ];
                                  //         },
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  //color size
                                  Row(
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Color:",
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 12)),
                                            TextSpan(
                                                text: " green",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Size:",
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 12)),
                                            TextSpan(
                                                text: " L",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  //quantity
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 20.sp,
                                        width: 30.sp,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          heroTag: "1",
                                          child: const Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 5.sp,),
                                      const Text("1"),
                                      SizedBox(width: 5.sp,),
                                      SizedBox(
                                        height: 20.sp,
                                        width: 30.sp,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          heroTag: "2",
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            //popup rupees
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                        child: Text(
                                          "Add to favorite",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        child: Text("Delete from the list"),
                                      ),
                                    ];
                                  },
                                ),
                                //rupees
                                const Text(
                                  "200",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //promo code
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your promo code"),
                  ),
                ),
              ),

              //amount
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total amount:",
                    style: TextStyle(color: Colors.black38),
                  ),
                  const Text(
                    "200",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                  ),
                ],
              ),

              //check out
              SizedBox(height: 2.h),
              Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.deepOrange,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "CHECK OUT",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
