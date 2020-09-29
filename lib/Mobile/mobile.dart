import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Mobile/aboutpagemobile.dart';
import 'package:tribus/Mobile/mobilehomepage.dart';
import 'package:tribus/Mobile/servicespagemobile.dart';
import 'package:tribus/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  var _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  void buildPage(int index) {
    return setState(() {
      _controller.animateToPage(index,
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
      Navigator.of(context).pop();
    });
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Drawer(
                elevation: 0.0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerHeader(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                            CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/lalitjarwal/Portfolio-v2/master/img/Adhaar.png')),
                            Center(
                                child: Text(
                              'Tribus Tech Solutions',
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ))
                          ])),
                      ListTile(
                        selected: _index == 0 ? true : false,
                        onTap: () {
                          buildPage(0);
                        },
                        selectedTileColor: kBlueColor,
                        title: buildTitle('Home', _index, 0),
                      ),
                      ListTile(
                        selected: _index == 1 ? true : false,
                        onTap: () {
                          buildPage(1);
                        },
                        selectedTileColor: kBlueColor,
                        title: buildTitle('Services', _index, 1),
                      ),
                      ListTile(
                        selected: _index == 2 ? true : false,
                        onTap: () {
                          buildPage(2);
                        },
                        selectedTileColor: kBlueColor,
                        title: buildTitle('Products', _index, 2),
                      ),
                      ListTile(
                        selected: _index == 3 ? true : false,
                        selectedTileColor: kBlueColor,
                        onTap: () {
                          buildPage(3);
                        },
                        title: buildTitle('Join Us', _index, 3),
                      ),
                      ListTile(
                        selected: _index == 4 ? true : false,
                        onTap: () {
                          buildPage(4);
                        },
                        selectedTileColor: kBlueColor,
                        title: buildTitle('Our Team', _index, 4),
                      ),
                      ListTile(
                        selected: _index == 5 ? true : false,
                        onTap: () {
                          buildPage(5);
                        },
                        selectedTileColor: kBlueColor,
                        title: buildTitle('About', _index, 5),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
      floatingActionButton: _index != 0
          ? SizedBox(
              width: 46,
              height: 46,
              child: FloatingActionButton(
                  backgroundColor: kBlueColor,
                  child: Icon(
                    Icons.arrow_drop_up_rounded,
                    size: 46,
                  ),
                  onPressed: () {
                    _controller.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  }),
            )
          : null,
      appBar: AppBar(
        backgroundColor:
            _index == 0 ? kWhiteColor.withOpacity(0.8) : kWhiteColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: kBlueColor,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
                headline6: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: kBlueColor,
              fontSize: 16,
            ))),
        title: Image.network(
          'https://raw.githubusercontent.com/lalitjarwal/Portfolio-v2/master/img/Adhaar.png',
          width: 56,
        ),
      ),
      bottomNavigationBar: _index == 5
          ? BottomAppBar(
              child: Container(
              height: 83,
              width: double.infinity,
              color: Colors.white.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us:',
                        style: TextStyle(
                            color: kBlueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: Icon(Icons.phone),
                              iconSize: 24,
                              onPressed: () {
                                launch('tel:=918005567003');
                              })
                        ],
                      )
                    ]),
              ),
            ))
          : null,
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            _index = value;
          });
        },
        allowImplicitScrolling: true,
        children: [
          MobileHomePage(),
          ServicePageMobile(),
          Container(
            color: Colors.blue,
            child: Center(child: Text('products')),
          ),
          Container(
            color: Colors.red,
            child: Center(child: Text('join us')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('team')),
          ),
          AboutPageMobile()
        ],
      ),
    );
  }

  Text buildTitle(String title, int index, int position) {
    return Text(
      title,
      style: TextStyle(
        color: index == position ? kWhiteColor : kBlackColor,
        fontSize: 16,
      ),
    );
  }
}
