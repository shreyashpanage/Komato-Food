import 'package:flutter/material.dart';
import 'package:fullstack_project/OrderData.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviousOrderData extends StatelessWidget {
  final List<OrderData> orderlist;
  const PreviousOrderData({super.key, required this.orderlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9DBBA),
      body: ListView.builder(
        itemCount: orderlist.length,
        itemBuilder: (context, item) {
          final order = orderlist[item];
          return MyPreviousOrder(
            image: order.image,
            name: order.name,
          );
        },
      ),
    );
  }
}

class MyPreviousOrder extends StatelessWidget {
  final String image;
  final String name;
  const MyPreviousOrder({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 25,
          ),
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),fit: BoxFit.cover
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            name,
            style: GoogleFonts.lato(
                fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
