// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // Variable string for changing the text
  String snackBarText = "";
  String imageLoc = "assets/1.png";

  // variable for carousel dots
  int _current = 0;

  // List of Titles
  static List<String> imgList = [
    "Set Your destination",
    "Enjoy The Holiday",
    "Look for a travel Agent"
  ];

  // List of Widgets formed with above titles
  final List<Widget> imageSlider = imgList.map((item) => texter(item)).toList();

  // For controlling the carousel
  final CarouselController _controller = CarouselController();

  // Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white),
          // Backgroung image
          Positioned(
            top: -110,
            child: Image(
              // fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              image: AssetImage(imageLoc),
            ),
          ),

          // Column having other widgets(buttons, text and, containers)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider(
                  carouselController: _controller,
                  items: imageSlider,
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                            switch (_current) {
                              case 0:
                                imageLoc = "assets/1.png";
                                break;
                              case 1:
                                imageLoc = "assets/2.png";
                                break;
                              case 2:
                                imageLoc = "assets/3.png";
                                break;
                              default:
                                imageLoc = "assets/1.png";
                                break;
                            }
                          },
                        );
                      },
                      enableInfiniteScroll: false,
                      reverse: false,
                      viewportFraction: 1,
                      height: 130),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dots
                      _current != 2
                          ? Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Row(
                                children: imgList.map((url) {
                                  int index = imgList.indexOf(url);
                                  return _current == index
                                      ? Padding(
                                          padding: EdgeInsets.only(right: 12),
                                          child: Container(
                                            height: 11,
                                            width: 20,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 0),
                                            decoration: BoxDecoration(
                                                // shape: BoxShape.circle,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: Colors.red[400]),
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(right: 12),
                                          child: Container(
                                            height: 8,
                                            width: 8,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey.shade400),
                                          ),
                                        );
                                }).toList(),
                              ),
                            )
                          : Container(
                              height: 0,
                              width: 0,
                            ),

                      // Changing state of NEXT button with FINISH
                      _current == 2
                          ? GestureDetector(
                              onTap: () {
                                _controller.nextPage();
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width - 50,
                                decoration: BoxDecoration(
                                  color: Colors.red[300],
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 4,
                                        color:
                                            Colors.grey[200].withOpacity(0.7)),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8.0, 6, 8, 6),
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _controller.nextPage();
                              },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.red[300],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 4,
                                        color:
                                            Colors.grey[200].withOpacity(0.7)),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.white, size: 35),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for displaying the text on the screen.
  static Widget texter(String heading) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 36, right: 36),
                child: Text(
                  heading,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      height: 1.3,
                      fontSize: 27),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 36, left: 36),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "The first mate and his Skipper too will done their very comfortable in their belt total island nest to till the end. ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
