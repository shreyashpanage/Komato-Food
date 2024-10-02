import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatelessWidget {

  final String username;

  const HomePage({super.key,required this.username});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/homebackround.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome "+username,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                      Text(
                        "Komato Food",
                        style: GoogleFonts.mateSc(
                            color: Colors.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mountain\nMelt Burger",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Double layers of melted cheddar and Swiss chesse over\nsucculent potato patty. Caramelized onions,frsh lettuce,\nand tangy house-made mustard",
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ), // <-- Radius

                        child: Text(
                          "Order Now",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 600,
                    height: 500,
                    child: ModelViewer(
                      src: "assets/models/burger_model.glb",
                      loading: Loading.eager,
                      autoRotate: true,
                      autoRotateDelay: 0,
                      cameraOrbit: "-10deg 80deg 9m",
                      autoPlay: true,
                      disablePan: true,
                      disableZoom: true,
                      disableTap: true,
                    ),
                  )
                ],
              ),
    );
  }
}
