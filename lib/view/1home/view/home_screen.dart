import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/firebase_helper.dart';
import 'package:shopify/view/1home/controller/home_controller.dart';
import 'package:shopify/view/1home/model/home_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    FireBaseHelper.fireBaseHelper.userDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FireBaseHelper.fireBaseHelper.selectProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? qs = snapshot.data;
            List<QueryDocumentSnapshot> qsList = qs!.docs;
            List<HomeModel> productList = [];

            for (var x in qsList) {
              Map m1 = x.data() as Map;
              String? id = x.id;
              String? name = m1['name'];
              String? subname = m1['subname'];
              String? image = m1['image'];
              String? price = m1['price'];
              String? desc = m1['description'];
              String? cate = m1['category'];


              HomeModel h1 = HomeModel(
                image: image,
                name: name,
                subname: subname,
                id: id,
                description: desc,
                price: price,
                category: cate,
              );
              // HomeModel h1 = HomeModel(
              //   name: x['name'],
              //   subname: x['subname'],
              //   image: x['image'],
              //   category: x['category'],
              //   price: x['price'],
              //   description: x['description'],
              //   id : x.id,
              // );

              productList.add(h1);
            }

            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //search
                      SizedBox(
                        height: 6.h,
                        width: 100.w,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepOrange, width: 2),
                                  borderRadius: BorderRadius.circular(60)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(60)),
                              border: InputBorder.none,
                              labelStyle: const TextStyle(color: Colors.black),
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 26,
                                color: Colors.black,
                              ),
                              label: const Text("Search item here ...")),
                        ),
                        //   const CircleAvatar(
                        //     radius: 20,
                        //   ),
                        // ],
                        // ),
                      ),
                      //cloths
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Street clothes",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black45),
                          ),
                        ],
                      ),
                      const Text(
                        "All clothes available here",
                        style: TextStyle(color: Colors.black26),
                      ),
                      //items
                      SizedBox(
                        height: 2.h,
                      ),
                      CarouselSlider(
                        items: controller.imgList
                            .asMap()
                            .entries
                            .map(
                              (e) => Container(
                                height: 15.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${controller.imgList[e.key]}"),
                                      fit: BoxFit.cover),
                                ),
                                alignment: Alignment.bottomLeft,
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Up to 20% of",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: 20.h,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      //sale
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Sale",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black45),
                          ),
                        ],
                      ),
                      const Text(
                        "Super summer sale",
                        style: TextStyle(color: Colors.black26),
                      ),
                      //sale item
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 32.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed("addtocart",arguments: productList[index]);
                              },
                              child: saleItem(
                                  productList[index].image,
                                  productList[index].name,
                                  productList[index].subname,
                                  productList[index].price),
                            );
                          },
                          itemCount: productList.length,
                        ),
                      ),

                      //new
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "New",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View all",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black45),
                          ),
                        ],
                      ),
                      const Text(
                        "You've never seen it before!",
                        style: TextStyle(color: Colors.black26),
                      ),
                      //sale item
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 32.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed("addtocart",arguments: productList[index]);
                              },
                              child: newItem(
                                  productList[index].image,
                                  productList[index].name,
                                  productList[index].subname,
                                  productList[index].price),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
              backgroundColor: Colors.deepOrange.shade100,
            ),
          );
        },
      ),
    );
  }
}

Widget saleItem(image, name, subname, price) {
  return Container(
    height: 32.h,
    width: 35.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Container(
              height: 20.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage("$image"),
                ),
              ),
              alignment: const Alignment(1, 1.3),
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            //rating
            const Text(
              "⭐⭐⭐⭐⭐",
            ),
            //name
            Text(
              "$name",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            //sub name
            Text(
              "$subname",
              style: const TextStyle(fontSize: 13, color: Colors.black38),
            ),
            //price
            Text(
              "₹ $price",
              style: const TextStyle(fontSize: 13, color: Colors.deepOrange),
            ),
            SizedBox(
              height: 0.2.h,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget newItem(image, name, subname, price) {
  return Container(
    height: 32.h,
    width: 35.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Container(
              height: 20.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage("$image"),
                ),
              ),
              alignment: const Alignment(1, 1.3),
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            //rating
            const Text(
              "⭐⭐⭐⭐⭐",
            ),
            //name
            Text(
              "$name",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            //SUb name
            Text(
              "$subname",
              style: const TextStyle(fontSize: 13, color: Colors.black38),
            ),
            //price
            Text(
              "₹ $price",
              style: const TextStyle(fontSize: 13, color: Colors.deepOrange),
            ),
            SizedBox(
              height: 0.2.h,
            ),
          ],
        )
      ],
    ),
  );
}
