import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fullstack_project/CustomerFeedback.dart';
import 'package:fullstack_project/HomePage.dart';
import 'package:fullstack_project/InstagramPage.dart';
import 'package:fullstack_project/OrderData.dart';
import 'package:fullstack_project/OrderPage.dart';
import 'package:fullstack_project/PreviousOrder.dart';
import 'package:fullstack_project/Quality.dart';
import 'package:http/http.dart' as http;

class AfterLoginPage extends StatelessWidget {
  final String username;
  final String email;
  const AfterLoginPage(
      {super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9DBBA),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () async {
            final url = Uri.parse('http://localhost:8080/retrieveData?email=$email');
            //controller request

            final response = await http.get(url);

            if(response.statusCode==200){
              List<dynamic> data = json.decode(response.body);
              List<OrderData> orderList = data.map((item)=>OrderData.fromJson(item)).toList();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreviousOrderData(orderlist:orderList,)),
            );
            }else{
              throw Exception("Something went Wrong");
            }
          },
          backgroundColor: Colors.yellow,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePage(
              username: username,
            ),
            const QuiltyPage(),
            Orderpage(
              email: email,
            ),
            const InstagramPage(),
            const CustomerFeedback(),
          ],
        ),
      ),
    );
  }
}
