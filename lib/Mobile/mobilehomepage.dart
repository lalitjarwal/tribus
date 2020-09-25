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
              decoration: buildBoxDecoration(
                  'https://image.freepik.com/free-photo/group-people-working-website-template_53876-25068.jpg'),
              child: buildCenter(
                  'We Are Professional',
                  'We at Tribus try our best to solve modern-day problems with smart' +
                      ' solutions \n using advanced technology. Our main tools are Mobile and Web applications that provides' +
                      ' the \n effortless result with utmost accuracy. '),
            ),
            Container(
              child: buildCenter('Quality is First Priority',
                  'Our main aim to provide best of best products and services to clients.\nQuality is the only thing by which Tribus is alive '),
              decoration: buildBoxDecoration(
                  'https://image.freepik.com/free-photo/close-up-humans-handshake-with-tech-background_23-2148320005.jpg'),
            ),
            Container(
              child: buildCenter('We Follow Only Passion',
                  'Our team follow passion in their work, support in the team work, \n professionalism with clients. '),
              decoration: buildBoxDecoration(
                  'https://image.freepik.com/free-photo/young-businessman-having-many-ideas_23-2148320019.jpg'),
            )
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
                //print(_index);
              });
            },
             viewportFraction: 1,
             height: MediaQuery.of(context).size.height,
            // aspectRatio: MediaQuery.of(context).size.height/MediaQuery.of(context).size.width,
            autoPlay: true,
          )),
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
            ])),
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
          borderRadius: BorderRadius.circular(5)),
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
      ],
    ));
  }

  BoxDecoration buildBoxDecoration(String url) {
    return BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.multiply),
            image: NetworkImage(
              url,
            ),
            fit: BoxFit.cover));
  }
}
