import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tribus/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverProfile extends StatefulWidget {
  final String title;
  final String name;
  final String dpUrl;
  final String email;
  final String instaUrl;
  final String linkedInUrl;

  HoverProfile(
      {Key key,
      this.dpUrl,
      this.email,
      this.instaUrl,
      this.linkedInUrl,
      this.name,
      this.title})
      : super(key: key);

  @override
  _HoverProfileState createState() => _HoverProfileState();
}

class _HoverProfileState extends State<HoverProfile> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        width: size.width / 5,
        height: size.height / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: _isHover
                ? [
                    BoxShadow(
                        offset: Offset(10, 10),
                        blurRadius: 8,
                        color: Colors.grey)
                  ]
                : [
                    BoxShadow(
                        offset: Offset(5, 5), blurRadius: 4, color: Colors.grey)
                  ],
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://image.freepik.com/free-vector/blue-wavy-abstract-background_1409-897.jpg',
                ))),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width / 10,
              height: size.width / 10,
              decoration: BoxDecoration(
                  boxShadow: _isHover
                      ? [
                          BoxShadow(
                              offset: Offset(-5, -5),
                              blurRadius: 8,
                              color: Colors.grey)
                        ]
                      : null,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        widget.dpUrl,
                      )),
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Color(0xffececec))),
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kBlueColor.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Image.network(
                      'https://www.flaticon.com/svg/static/icons/svg/732/732200.svg',
                      width: 32,
                    ),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(text: widget.email))
                          .then((_) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            content:
                                Text("Email address copied to clipboard")));
                      });
                    }),
                IconButton(
                    icon: Image.network(
                      'https://www.flaticon.com/svg/static/icons/svg/2111/2111463.svg',
                      width: 26,
                    ),
                    onPressed: () {
                      //print('Clicked');
                      launch(widget.instaUrl);
                      //openLink('https://www.instagram.com/oyelalit/');
                    }),
                IconButton(
                    icon: Image.network(
                      'https://www.flaticon.com/svg/static/icons/svg/174/174857.svg',
                      width: 26,
                    ),
                    onPressed: () {
                      launch(widget.linkedInUrl);
                    })
              ],
            )
          ],
        )),
      ),
    );
  }

}
