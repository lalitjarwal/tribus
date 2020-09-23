import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Mobile/mobilehomepage.dart';
import 'package:tribus/constants.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _controller = PageController();
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
      
      drawer: Drawer(
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
                  textScaleFactor: 1.5,
                ))
              ])),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(0);
            },
            title: Text('Home'),
          ),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(1);
            },
            title: Text('Services'),
          ),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(2);
            },
            title: Text('Products'),
          ),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(3);
            },
            title: Text('Join Us'),
          ),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(4);
            },
            title: Text('Our Team'),
          ),
          ListTile(
            selected: true,
            onTap: () {
              buildPage(5);
            },
            title: Text('About'),
          ),
        ],
      )),
      floatingActionButton:
          _index != 0 ? SizedBox(
            width: 46,
            height: 46,
                      child: FloatingActionButton(
              backgroundColor: kBlueColor,
              child: Icon(Icons.arrow_drop_up_rounded,size: 46,),
              onPressed: () {
              _controller.animateToPage(0, duration:Duration(milliseconds:300), curve: Curves.linear);
            }),
          ) : null,
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
          Container(
            color: Colors.blue,
            child: Center(child: Text('about')),
          ),
        ],
      )),
    );
  }
}
