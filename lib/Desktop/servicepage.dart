import 'package:flutter/material.dart';
import 'package:tribus/Widgets/Hovercard_service.dart';
import 'package:tribus/Widgets/title.dart';
import 'package:tribus/constants.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/services_background.jpg'),
        ),
      ),
      child: Center(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          TitleString('SERVICES'),
          SizedBox(height: MediaQuery.of(context).size.height / 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            HoverCardService(
              url: 'images/mobile_service.jpg',
              title: kMobileTitle,
              desc: kMobileDesc,
            ),
            HoverCardService(
              url: 'images/web_service.jpg',
              title: kWebTitle,
              desc: kWebDesc,
            ),
            HoverCardService(
              url: 'images/iot_service.jpg',
              title: kIotTitle,
              desc: kIotDesc,
            ),
          ]),
        ]),
      ),
    );
  }
}
