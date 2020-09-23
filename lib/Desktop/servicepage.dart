import 'package:flutter/material.dart';
import 'package:tribus/Widgets/Hovercard_service.dart';
import 'package:tribus/Widgets/title.dart';

class ServicePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://image.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1105.jpg',
              ))),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/8,
            ),
            TitleString('SERVICES'),
            SizedBox(height: MediaQuery.of(context).size.height/16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HoverCardService(
                  url:
                      'https://image.freepik.com/free-vector/vector-illustration-hand-holding-smartphone_7737-1681.jpg',
                  title: 'Mobile App Development',
                  desc: '',
                ),
                HoverCardService(
                  url:
                      'https://image.freepik.com/free-photo/close-up-image-programer-working-his-desk-office_1098-18707.jpg',
                  title: 'Web Development',
                  desc: '',
                ),
                HoverCardService(
                  url:
                      'https://image.freepik.com/free-vector/illustration-smart-devices-network-web-cloud-communication-technology_33099-450.jpg',
                  title: 'IOT & Embedded Solutions',
                  desc: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


