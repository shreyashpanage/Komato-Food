import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Orderpage extends StatelessWidget {
  final String email;
  const Orderpage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "OUR SPECIAL MENU",
            style: GoogleFonts.laila(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          ),
          Text(
            "POPULAR MENU",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
          Text(
            "The dish features succulent, plump shrimp and tender calamari, perfectly",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          Text(
            "cooked to maintain their delicate textures.",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderContainer(
                image: "images/burger1.jpg",
                name: "Classic Charm",
                time: "30 min",
                email: email,
              ),
              const SizedBox(
                width: 40,
              ),
              OrderContainer(
                image: "images/burger2.jpg",
                name: "Crispy Delight",
                time: "30 min",
                email: email,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderContainer(
                image: "images/burger3.jpg",
                name: "Spicy Crunch",
                time: "30 min",
                email: email,
              ),
              const SizedBox(
                width: 40,
              ),
              OrderContainer(
                image: "images/burger4.jpg",
                name: "Smoky Deluxe",
                time: "15 sec",
                email: email,
              ),
            ],
          )
        ],
      ),
    );
  }
}

void sendEmailRequest() {}

class OrderContainer extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String email;
  const OrderContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Special",
                  style: GoogleFonts.abel(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: GoogleFonts.lato(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Delivery Time :",
                style:
                    GoogleFonts.lato(color: const Color.fromARGB(168, 0, 0, 0)),
              ),
              Text(
                time,
                style:
                    GoogleFonts.lato(color: const Color.fromARGB(168, 0, 0, 0)),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () async {
                  //controller request
                  final Map<String, String> requestBody1 = {
                    'email': email,
                    'time': time,
                  };

                  final Map<String, String> requestBody2 = {
                    'email': email,
                    'image': image,
                    'name': name,
                  };

                  final response1 = await http.post(
                    Uri.parse('http://localhost:8080/order'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode(requestBody1),
                  );

                  if (response1.statusCode == 200) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Order Confirmation"),
                          content:
                              const Text("Your order has been placed successfully!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Closes the dialog
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );

                    final response2 = await http.post(
                      Uri.parse('http://localhost:8080/storedata'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode(requestBody2),
                    );

                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Alert",
                            style: TextStyle(color: Colors.red),
                          ),
                          content: const Text("Something went wrong!!!!!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Closes the dialog
                              },
                              child: const Text("retry"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("Order Now"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
