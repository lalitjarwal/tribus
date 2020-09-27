import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class HoverCardService extends StatefulWidget {
  final String url;
  final String title;
  final String desc;

  HoverCardService(
      {Key key, @required this.desc, @required this.title, this.url})
      : super(key: key);

  @override
  _HoverCardServiceState createState() => _HoverCardServiceState();
}

class _HoverCardServiceState extends State<HoverCardService> {
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: _isHover ? 16 : 10,
          child: AnimatedContainer(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/shiny-white-gray-background-with-wavy-lines_1017-25101.jpg'))),
            duration: Duration(milliseconds: 100),
            width: _isHover ? size.width / 4 + 10 : size.width / 4,
            height: _isHover ? size.height / 1.5 + 10 : size.height / 1.5,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        widget.url,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 18,
                          )),
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
