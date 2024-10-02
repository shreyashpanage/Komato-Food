import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuiltyPage extends StatelessWidget {
  const QuiltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: Row(
        children: [
          const SizedBox(
            width: 100,
          ),
          const Image(
            image: AssetImage("images/chef.png"),
            height: 1300,
            width: 600,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ABOUT OUR COMPANY",
                style: GoogleFonts.laila(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20),
              ),
              Text(
                "Where Quality\nExcellent Service",
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
              Text(
                "Serious Eats is dedicated to exploring the science and art of cooking.",
                style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
              ),
              Text(
                "We offer meticulously recipes researched in-depth food science",
                style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                
                onPressed: () {},
                child: Text(
                  "Learn More",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
