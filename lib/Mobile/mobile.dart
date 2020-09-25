import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Mobile/aboutpagemobile.dart';
import 'package:tribus/Mobile/mobilehomepage.dart';
import 'package:tribus/constants.dart';

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
      drawer: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Drawer(
                elevation: 0.0,
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
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }),
            )
          : null,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
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
      body: Scrollbar(
          thickness: 8,
          radius: Radius.circular(2.5),
          child: PageView(
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
              Container(
                color: Colors.green,
                child: Center(child: Text('services')),
              ),
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
          )),
    );
  }

  Text buildTitle(String title, int index, int position) {
    return Text(
      title,
      style: TextStyle(
        color: index == position ? kWhiteColor : kBlackColor,
        fontSize: MediaQuery.of(context).size.width <= 480 ? 14 : 18,
      ),
    );
  }
}
