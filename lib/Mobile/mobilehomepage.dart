import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tribus/Widgets/hovericon.dart';
import 'package:tribus/constants.dart';

class MobileHomePage extends StatefulWidget {
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final _controller = CarouselControllerImpl();
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      CarouselSlider(
        carouselController: _controller,
        items: [
          Container(
            decoration: buildBoxDecoration('images/carousel1.jpg'),
            child: buildCenter(kCarouselTitle1, kCarouselDesc1),
          ),
          Container(
            child: buildCenter(kCarouselTitle2, kCarouselDesc2),
            decoration: buildBoxDecoration('images/carousel2.jpg'),
          ),
          Container(
            child: buildCenter(kCarouselTitle3, kCarouselDesc3),
            decoration: buildBoxDecoration('images/carousel3.jpg'),
          )
        ],
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() => _index = index);
          },
          viewportFraction: 1,
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: GestureDetector(
            onTap: () {
              _controller.previousPage();
            },
            child: HoverIcons(
              icon: Icons.arrow_back_ios_rounded,
              size: 32,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          child: GestureDetector(
            onTap: () {
              _controller.nextPage();
            },
            child: HoverIcons(
              icon: Icons.arrow_forward_ios_rounded,
              size: 32,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            buildAnimatedContainer(0),
            SizedBox(width: 5),
            buildAnimatedContainer(1),
            SizedBox(width: 5),
            buildAnimatedContainer(2),
          ]),
        ),
      )
    ]);
  }

  AnimatedContainer buildAnimatedContainer(int index) {
    return AnimatedContainer(
      height: 8,
      width: _index == index ? 30 : 20,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: _index == index ? kBlueColor : kWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Center buildCenter(String title, String description) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(color: kWhiteColor, fontSize: 14),
              ),
            )
          ]),
    );
  }

  BoxDecoration buildBoxDecoration(String url) {
    return BoxDecoration(
      image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.multiply),
          image: AssetImage(
            url,
          ),
          fit: BoxFit.cover),
    );
  }
}
