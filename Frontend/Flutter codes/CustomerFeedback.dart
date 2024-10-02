import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerFeedback extends StatelessWidget {
  const CustomerFeedback({super.key});

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
            "CUSTOMER FEEDBACK",
            style: GoogleFonts.laila(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          ),
          Text(
            "CUSTOMER SAYS",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
          Text(
            "our restaurant, customer satisfaction is our top priority. Here's what some of",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          Text(
            "our happy customers have to say about their experience",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomerContainer(),
              SizedBox(
                width: 30,
              ),
              CustomerContainer(),
              SizedBox(
                width: 30,
              ),
             CustomerContainer(),
            ],
          )
        ],
      ),
    );
  }
}


class CustomerContainer extends StatelessWidget {
  const CustomerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
               width: 300,
                height: 200,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundImage: AssetImage("images/avatar3.jpg"),),
                        SizedBox(width: 7,),
                        Text("Guy Hawkins"),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text(
                        "a complete account of the system, and expound, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure"),
                    SizedBox(height: 7,),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_half,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 7,),
                        Text("4.5k")
                      ],
                    )
                  ],
                ),
              );
  }
}