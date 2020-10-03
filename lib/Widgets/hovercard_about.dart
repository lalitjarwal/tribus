import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class HoverCard extends StatefulWidget {
  final String title;
  final String bannerUrl;
  final String url;
  final String desc;
  HoverCard({Key key, this.title, this.bannerUrl, this.url, this.desc})
      : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
        onEnter: (event) {
          print(MediaQuery.of(context).size.height);
          setState(() {
            _isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHover = false;
          });
        },
        child: Card(
          //shadowColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: _isHover ? 26.0 : 4.0,
          child: Container(
            width: size.width / 3.4,
            height: size.height / 2.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.bannerUrl))),
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.title,
                                textScaleFactor: 2,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: kBlueColor),
                              ),
                            ),
                            Divider(
                              indent: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                widget.desc,
                                textAlign: TextAlign.justify,
                                textScaleFactor: size.width <= 1450 ? 0.7 : 0.9,
                                maxLines: 12,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: kBlackColor),
                              ),
                            ),
                            Spacer(),
                          ]),
                    ),
                  ],
                ),
                Positioned(
                  left: size.width / 13,
                  child: CircleAvatar(
                    radius: size.width / 51.2, //26.46
                    backgroundImage: NetworkImage(widget.url),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
