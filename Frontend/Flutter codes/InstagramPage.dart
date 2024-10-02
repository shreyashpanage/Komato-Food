import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramPage extends StatelessWidget {
  const InstagramPage({super.key});

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
            "OUR GALLERY",
            style: GoogleFonts.laila(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          ),
          Text(
            "INSTAGRAM POST",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
          Text(
            "Join our vibrant foodie family! Share your culinary adventures, tag us, and let's",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          Text(
            "build a community the love of good food together",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverEffectContainer(
                height: 250,
                width: 250,
                image: "images/people_eating.jpg",
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  HoverEffectContainer(
                      height: 120, width: 120, image: "images/icecream.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                  HoverEffectContainer(
                      height: 120, width: 120, image: "images/pasta.jpg")
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  HoverEffectContainer(
                      height: 120, width: 120, image: "images/pizza.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                  HoverEffectContainer(
                      height: 120,
                      width: 120,
                      image: "images/whitesauce_pasta.jpg"),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              HoverEffectContainer(
                  height: 250, width: 250, image: "images/sudhi.jpg"),
            ],
          )
        ],
      ),
    );
  }
}

class HoverEffectContainer extends StatefulWidget {
  final double height;
  final double width;
  final String image;
  HoverEffectContainer(
      {required this.height, required this.width, required this.image});
  @override
  _HoverEffectContainerState createState() => _HoverEffectContainerState();
}

class _HoverEffectContainerState extends State<HoverEffectContainer> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
            ),
            if (_isHovering)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                    width: widget.width,
                    height: widget.height,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
