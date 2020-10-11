import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Mobile/aboutpagemobile.dart';
import 'package:tribus/Mobile/joinpagemobile.dart';
import 'package:tribus/Mobile/mobilehomepage.dart';
import 'package:tribus/Mobile/productpagemobile.dart';
import 'package:tribus/Mobile/servicespagemobile.dart';
import 'package:tribus/Mobile/teampagemobile.dart';
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
      resizeToAvoidBottomPadding: false,
      //extendBodyBehindAppBar: true,
      drawer: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Drawer(
              elevation: 0.0,
              child: SingleChildScrollView(
                child: Column(children: [
                  DrawerHeader(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('images/logo.png'),
                          ),
                          Center(
                            child: Text(
                              kCompanyName,
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ]),
                  ),
                  ListTile(
                    selected: _index == 0 ? true : false,
                    onTap: () {
                      buildPage(0);
                    },
                    selectedTileColor: kBlueColor,
                    title: buildTitle(kAction1, _index, 0),
                  ),
                  ListTile(
                    selected: _index == 1 ? true : false,
                    onTap: () {
                      buildPage(1);
                    },
                    selectedTileColor: kBlueColor,
                    title: buildTitle(kAction2, _index, 1),
                  ),
                  ListTile(
                    selected: _index == 2 ? true : false,
                    onTap: () {
                      buildPage(2);
                    },
                    selectedTileColor: kBlueColor,
                    title: buildTitle(kAction3, _index, 2),
                  ),
                  ListTile(
                    selected: _index == 3 ? true : false,
                    selectedTileColor: kBlueColor,
                    onTap: () {
                      buildPage(3);
                    },
                    title: buildTitle(kAction4, _index, 3),
                  ),
                  ListTile(
                    selected: _index == 4 ? true : false,
                    onTap: () {
                      buildPage(4);
                    },
                    selectedTileColor: kBlueColor,
                    title: buildTitle(kAction5, _index, 4),
                  ),
                  ListTile(
                    selected: _index == 5 ? true : false,
                    onTap: () {
                      buildPage(5);
                    },
                    selectedTileColor: kBlueColor,
                    title: buildTitle(kAction6, _index, 5),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _index != 0
          ? SizedBox(
              width: 46,
              height: 46,
              child: FloatingActionButton(
                  tooltip: 'Back to top',
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
          extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
        title: Image.asset(
          'images/logo.png',
          width: 56,
        ),
      ),
      bottomNavigationBar: _index == 5
          ? SizedBox(
            height: 56,
                      child: BottomAppBar(
            
                shape: CircularNotchedRectangle(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: kBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'CONTACT US',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {
                        // contact us code
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              //contact info here
                              return Center(
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Reach Us:',
                                        textScaleFactor: 1.5,
                                        style: TextStyle(
                                            color: kBlueColor,
                                            decoration: TextDecoration
                                                .underline)),
                                  ),
                                  ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: [
                                        buildOutlineButton(
                                          'Call',
                                          Icon(Icons.phone),
                                          'tel: +91 8005567003',
                                          110
                                        ),
                                        buildOutlineButton(
                                          'Email',
                                          Icon(Icons.mail),
                                          'mailto: tribustechsolutions@gmail.com',
                                          110
                                        ),
                                        buildOutlineButton(
                                          'Locate',
                                          FaIcon(
                                              FontAwesomeIcons.mapSigns),
                                          'https://www.google.com/maps/search/?api=1&query=26.807098,75.831752',
                                          110
                                        ),
                                      ]),
                                  Divider(color: Colors.black,height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Find Us On:',
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: kBlueColor,
                                        decoration:
                                            TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: [
                                        buildOutlineButton(
                                            'Instagram',
                                            FaIcon(
                                              FontAwesomeIcons
                                                  .instagramSquare,
                                              color: Color(0xFFC1359B),
                                             
                                            ),
                                            'https://www.google.com/',
                                             135),
                                        buildOutlineButton(
                                            'LinkedIn',
                                            FaIcon(
                                              FontAwesomeIcons.linkedin,
                                              color: Color(0xFF0077B5),
                                            ),
                                            'https://www.google.com/', 135),
                                        buildOutlineButton(
                                            'Facebook',
                                            FaIcon(
                                                FontAwesomeIcons
                                                    .facebookSquare,
                                                color: Color(0xFF4064AC)),
                                            'https://www.google.com/', 135),
                                      ]),
                                ]),
                              );
                            });
                      },
                    ),
                  ),
                ),
              ),
          )
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
            ProductPageMobile(),
            JoinPageMobile(),
            TeamPageMobile(),
            AboutPageMobile()
          ]),
    );
  }

  buildOutlineButton(String name, Widget icon, String passedUrl,double width) {
    return SizedBox(width: width,
          child: OutlineButton.icon(
        label: Center(child: Text(name)),
        splashColor: kBlueColor.withOpacity(0.7),
        textColor: Colors.black,
        shape: StadiumBorder(),
        
        icon: icon,
        onPressed: () => launch(passedUrl),
        
        borderSide: BorderSide(color: kBlueColor,width: 2.0),
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
