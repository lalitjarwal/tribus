import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Desktop/aboutpage.dart';
import 'package:tribus/Desktop/homepage.dart';
import 'package:tribus/Desktop/joinpage.dart';
import 'package:tribus/Desktop/productspage.dart';
import 'package:tribus/Desktop/servicepage.dart';
import 'package:tribus/Desktop/teampage.dart';
import 'package:tribus/Widgets/hoverbutton.dart';
import 'package:tribus/constants.dart';

class DesktopHome extends StatefulWidget {
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  var currIndex = 0;
  var _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
/////////////////////////////////////////////////////////////////////////--AppBar--//////////////////////////////////////////////
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: currIndex == 0 ? 0.0 : 4.0,
        backgroundColor:
            currIndex == 0 ? Colors.white.withOpacity(0.8) : kWhiteColor,
        textTheme: Theme.of(context).textTheme.copyWith(
                headline6: GoogleFonts.delius(
                    textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black.withOpacity(0.7),
              fontSize: 28,
            ))),
        title: Text(
          'Tribus Tech Solutions',
        ),
        leading: GestureDetector(
            onTap: () {
              buildPage(0);
            },
            child: Image.network(kLogoUrl)),
        actions: [
          HoverButton(
              selected: currIndex == 0 ? true : false,
              title: 'Home',
              onPressed: () {
                buildPage(0);
              }),
          HoverButton(
              selected: currIndex == 1 ? true : false,
              title: 'Services',
              onPressed: () {
                buildPage(1);
              }),
          HoverButton(
              selected: currIndex == 2 ? true : false,
              title: 'Products',
              onPressed: () {
                buildPage(2);
              }),
          HoverButton(
              selected: currIndex == 3 ? true : false,
              title: 'Join Us',
              onPressed: () {
                buildPage(3);
              }),
          HoverButton(
              selected: currIndex == 4 ? true : false,
              title: 'Our Team',
              onPressed: () {
                buildPage(4);
              }),
          HoverButton(
              selected: currIndex == 5 ? true : false,
              title: 'About',
              onPressed: () {
                buildPage(5);
              }),
          Container(width: 50, height: 50)
        ],
      ),
      /////////////////////////////////////////////////////////////////////////--Body--//////////////////////////////////////////////
      body: Scrollbar(
        thickness: 10,
        radius: Radius.circular(10),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              currIndex = value;
            });
          },
          controller: _controller,
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            HomePage(),
            ServicePage(),
            ProductPage(),
            JoinPage(),
            TeamPage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }

  void buildPage(int index) {
    return setState(() {
      _controller.animateToPage(index,
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    });
  }
}
